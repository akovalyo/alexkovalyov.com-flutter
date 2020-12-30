import 'package:universal_html/prefer_sdk/js.dart' as js;
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:mysite/consts/consts.dart';
import 'package:mysite/consts/unicode_characters.dart';
import 'package:mysite/helpers.dart';
import 'package:mysite/pages/something_wrong.dart';
import 'package:mysite/pages/post_page.dart';
import 'package:mysite/page_elements/footer.dart';
import 'package:mysite/page_elements/drawer.dart';
import 'package:mysite/page_elements/ak_app_bar.dart';
import 'package:mysite/widgets/scroll_upward.dart';
import 'package:mysite/widgets/image_placeholder.dart';
import 'package:mysite/widgets/animated_image.dart';
import 'package:mysite/widgets/wrap_scroll_tag.dart';

class PostBuilder extends StatelessWidget {
  final AutoScrollController controller;
  final Map<String, dynamic> postData;
  final DocumentSnapshot snapshot;

  PostBuilder({
    this.controller,
    this.postData,
    this.snapshot,
  });

  List<Map> extractBody(String body) {
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

  String replaceChar(String str) {
    str = str.replaceAll("\\n", "\n");
    str = str.replaceAll("\\t", "\t");
    Iterable<RegExpMatch> match = RegExp(r'\\u([\w]*)').allMatches(str);
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

  List<Widget> decodeBody(List<Map> extractedBody, BuildContext ctx) {
    final List<Widget> _listWidget = extractedBody.map((m) {
      final _key = m.keys.toString().replaceAll(RegExp('[()]'), '');
      final _screenSize = MediaQuery.of(ctx).size;
      final String _value = replaceChar(m[_key][1]);
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
          String _atribute;

          if (match != null) {
            _atribute = match.group(1);
            _str = match.group(2);
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
                em: TextStyle(fontWeight: FontWeight.bold, height: 1.5),
                a: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(ctx).accentColor),
                blockSpacing: 10,
              ),
              onTapLink: (text, link, title) {
                if (link.startsWith('http')) {
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
        // case 'webview':
        //   return Container(
        //       child: WebView(
        //     initialUrl: 'https://flutter.dev',
        //     javascriptMode: JavascriptMode.unrestricted,
        //   ));

        case 'image':
          String _path = _value;
          final _match = RegExp(r'(\[[a-z]+\])([\w\W]+)').firstMatch(_path);
          var _alignment = Alignment.center;
          String _atribute;
          if (_match != null) {
            _atribute = _match.group(1);
            _path = _match.group(2);
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
              children: _tableCells,
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
              children: _tableRows,
            ),
          );
          if (_widgetIdx == 0) return _child;
          return WrapScrollTag(
              child: _child, controller: controller, index: _widgetIdx);

        default:
          return Container();
      }
    }).toList();

    return _listWidget;
  }

  @override
  Widget build(BuildContext context) {
    if (snapshot.data() == null) return SomethingWentWrong();
    final _screenSize = MediaQuery.of(context).size;
    final _extracted = extractBody(snapshot.data()['body']);
    final _decoded = decodeBody(_extracted, context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(_screenSize.width, appBarHeight),
        child: AkAppBar(controller),
      ),
      drawer: AkDrawer(controller),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: controller,
            physics: ClampingScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: _screenSize.width,
                    height: _screenSize.height * 0.4,
                    child: FadeInImageAny(
                      imagePath: postData['image'],
                      placeholder: SizedBox(
                        width: _screenSize.width,
                        height: _screenSize.height * 0.4,
                      ),
                      width: _screenSize.width,
                      height: _screenSize.height * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        top: 20,
                        bottom: 10,
                        right: isSmallScreen(context)
                            ? paddingSmall
                            : paddingLarge,
                        left: isSmallScreen(context)
                            ? paddingSmall
                            : paddingLarge,
                      ),
                      child: Text(
                        postData['title'],
                        style: Theme.of(context).textTheme.headline4,
                      )),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        bottom: 20,
                        left: isSmallScreen(context)
                            ? paddingSmall
                            : paddingLarge,
                        right: isSmallScreen(context)
                            ? paddingSmall
                            : paddingLarge,
                      ),
                      child: Text(
                        postData['date'],
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen(context)
                            ? paddingSmall
                            : paddingLarge),
                    child: Column(
                      children: _decoded,
                    ),
                  ),
                  Container(
                    child: const Footer(),
                  ),
                ],
              ),
            ),
          ),
          ScrollUpward(
            controller,
            visiblePosition: 100,
            paddingRight: paddingSmall,
          ),
        ],
      ),
    );
  }
}
