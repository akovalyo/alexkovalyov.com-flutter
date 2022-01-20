import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:universal_html/js.dart' as js;
import '../consts/unicode_characters.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../widgets/wrap_scroll_tag.dart';
import '../widgets/post_element_container.dart';
import '../widgets/animated_image.dart';

class Post {
  String postId;
  final String date; //TODO: convert into DateTime
  final String description;
  final String imageUrl;
  final String path;
  final String title;
  final List<String> tags;

  Post({
    this.postId = '',
    this.date = '',
    this.description = '',
    this.imageUrl = '',
    this.path = '',
    this.title = '',
    this.tags = const [],
  });

  factory Post.fromData(Map<String, dynamic>? data) {
    if (data == null) return Post();
    return Post(
      date: data['date'] as String,
      description: data['description'] as String,
      imageUrl: data['image'] as String,
      path: data['path'] as String,
      title: data['title'] as String,
      tags: (data['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  List<Map> _extractBody(String body) {
    List<Map> list = [];
    Iterable<RegExpMatch> parsedBody =
        RegExp(r'{([a-zA-Z1-9]*){([0-9]*)}}([^\{\}]*){\/}').allMatches(body);
    parsedBody.forEach((element) {
      list.add({
        element.group(1): [element.group(2), element.group(3)]
      });
    });
    return list;
  }

  String _replaceChar(String str) {
    str = str.replaceAll("\\n", "\n");
    str = str.replaceAll("\\t", "\t");
    Iterable<RegExpMatch>? match = RegExp(r'\\u([\w]*)').allMatches(str);
    // ignore: unnecessary_null_comparison
    if (match == null) return str;
    Map toReplace = {};
    match.forEach((e) {
      if (unicodeMap.containsKey(e.group(0)))
        toReplace[e.group(0)] = unicodeMap[e.group(0)];
    });
    toReplace.forEach((key, value) {
      str = str.replaceAll(key, value);
    });
    return str;
  }

  // Future<DocumentSnapshot> loadBody() async {
  //   final CollectionReference bodyRef =
  //       FirebaseFirestore.instance.collection('posts/${this.postId}/body');
  //   final DocumentSnapshot snapshot = await bodyRef.doc('0').get();
  //   return snapshot;
  // }

  List<Widget> decodeBody(BuildContext ctx, AutoScrollController controller,
      DocumentSnapshot snapshot) {
    if (snapshot.data() == null) return <Widget>[];
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    final List<Map> extractedBody = _extractBody(data['body']);
    final List<Widget> listWidget = extractedBody.map((m) {
      final _key = m.keys.toString().replaceAll(RegExp('[()]'), '');
      final _screenSize = MediaQuery.of(ctx).size;
      final String _value = _replaceChar(m[_key][1]);
      final int _widgetIdx = m[_key][0].isEmpty ? 0 : int.parse(m[_key][0]);

      switch (_key) {
        case 'p':
          final _child = Divider();
          if (_widgetIdx == 0) return _child;
          return WrapScrollTag(
            child: _child,
            controller: controller,
            index: _widgetIdx,
          );

        case 'text':
          final _child = PostElementContainer(
            child: Text(
              _value,
            ),
            vertPadding: 10,
          );
          if (_widgetIdx == 0) return _child;
          return WrapScrollTag(
            child: _child,
            controller: controller,
            index: _widgetIdx,
          );

        case 'quote':
          final _child = PostElementContainer(
            alignment: Alignment.center,
            child: Text(
              _value,
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic,
              ),
            ),
            vertPadding: 10,
          );
          if (_widgetIdx == 0) return _child;
          return WrapScrollTag(
            child: _child,
            controller: controller,
            index: _widgetIdx,
          );

        case 'code':
          final _child = PostElementContainer(
            child: SelectableText(
              _value,
              style: TextStyle(fontSize: 16, letterSpacing: 1),
            ),
            vertPadding: 10,
            horPadding: 20,
            background: Theme.of(ctx).primaryColor.withAlpha(30),
          );
          if (_widgetIdx == 0) return _child;
          return WrapScrollTag(
            child: _child,
            controller: controller,
            index: _widgetIdx,
          );

        case 'headline4':
          final _child = PostElementContainer(
            vertPadding: 20,
            alignment: Alignment.center,
            child: Text(
              _value,
              style: Theme.of(ctx).textTheme.headline4,
            ),
          );
          if (_widgetIdx == 0) return _child;
          return WrapScrollTag(
            child: _child,
            controller: controller,
            index: _widgetIdx,
          );

        case 'headline5':
          final _child = PostElementContainer(
            vertPadding: 20,
            alignment: Alignment.center,
            child: Text(
              _value,
              style: Theme.of(ctx).textTheme.headline5,
            ),
          );
          if (_widgetIdx == 0) return _child;
          return WrapScrollTag(
            child: _child,
            controller: controller,
            index: _widgetIdx,
          );

        case 'headline6':
          final _child = PostElementContainer(
            vertPadding: 20,
            alignment: Alignment.center,
            child: Text(
              _value,
              style: Theme.of(ctx).textTheme.headline6,
            ),
          );
          if (_widgetIdx == 0) return _child;
          return WrapScrollTag(
            child: _child,
            controller: controller,
            index: _widgetIdx,
          );

        case 'markdown':
          String _str = _value;
          final match = RegExp(r'(\[\[[a-z]+\]\])([\w\W]+)').firstMatch(_str);
          var _alignment = Alignment.centerLeft;
          String _atribute = "";

          if (match != null) {
            _atribute = match.group(1)!;
            _str = match.group(2)!;
          }
          if (_atribute == '[[center]]') {
            _alignment = Alignment.center;
          }
          var _child = PostElementContainer(
            alignment: _alignment,
            vertPadding: 10,
            child: MarkdownBody(
              data: _str,
              selectable: false,
              styleSheet: MarkdownStyleSheet(
                em: TextStyle(height: 1.5, fontSize: 18),
                a: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(ctx).colorScheme.secondary),
                blockSpacing: 10,
              ),
              onTapLink: (text, link, title) {
                if (link!.startsWith('http')) {
                  js.context.callMethod('open', [link]);
                } else {
                  controller.scrollToIndex(
                    int.parse(link),
                    preferPosition: AutoScrollPosition.middle,
                    duration: Duration(milliseconds: 1000),
                  );
                }
              },
            ),
          );
          if (_widgetIdx == 0) return _child;
          return WrapScrollTag(
              child: _child, controller: controller, index: _widgetIdx);

        case 'image':
          String _path = _value;
          final _match = RegExp(r'(\[[a-z]+\])([\w\W]+)').firstMatch(_path);
          var _alignment = Alignment.center;
          String _atribute = "";
          if (_match != null) {
            _atribute = _match.group(1)!;
            _path = _match.group(2)!;
          }
          if (_atribute == '[left]') {
            _alignment = Alignment.centerLeft;
          } else if (_atribute == '[right]') {
            _alignment = Alignment.centerRight;
          }
          final _child = Container(
            alignment: _alignment,
            width: _screenSize.width * 0.6,
            child: AnimatedImage(_path),
          );
          if (_widgetIdx == 0) return _child;
          return WrapScrollTag(
              child: _child, controller: controller, index: _widgetIdx);

        case 'table':
          var numRow = 0;
          List _rows = _value.split('|');
          List _tableRows = _rows.map((row) {
            List _cells = row.split('\t');
            List _tableCells = _cells.map((cell) {
              if (numRow == 0) {
                return TableCell(
                  child: Text(
                    cell,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }
              return TableCell(
                child: Text(
                  cell,
                  textAlign: TextAlign.center,
                ),
              );
            }).toList();
            numRow++;
            return TableRow(
              children: _tableCells as List<Widget>,
            );
          }).toList();

          final _child = Container(
            alignment: Alignment.center,
            width: _screenSize.width * 0.4,
            child: Table(
              border: TableBorder.all(
                width: 1.0,
                color: Colors.grey,
              ),
              children: _tableRows as List<TableRow>,
            ),
          );
          if (_widgetIdx == 0) return _child;
          return WrapScrollTag(
              child: _child, controller: controller, index: _widgetIdx);

        default:
          return Container();
      }
    }).toList();

    return listWidget;
  }
}
