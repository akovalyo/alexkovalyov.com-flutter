import 'package:universal_html/prefer_sdk/js.dart' as js;
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:provider/provider.dart';

import 'package:mysite/models/posts_model.dart';
import 'package:mysite/consts/consts.dart';
import 'package:mysite/layout/screen_size.dart';
import 'package:mysite/widgets/footer.dart';
import 'package:mysite/layout/image_placeholder.dart';
import 'package:mysite/widgets/animated_image.dart';
import 'package:mysite/consts/unicode_characters.dart';
import 'package:mysite/pages/something_wrong.dart';

class PostElementContainer extends StatelessWidget {
  final Widget child;
  final double vertPadding;
  final double horPadding;
  final Color background;
  final Alignment alignment;

  PostElementContainer({
    this.child,
    this.vertPadding = 0,
    this.horPadding = 0,
    this.background,
    this.alignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: EdgeInsets.symmetric(
        vertical: vertPadding,
        horizontal: horPadding,
      ),
      child: child,
      color: background,
    );
  }
}

class PostBuilder extends StatefulWidget {
  final String path;
  PostBuilder(this.path);

  @override
  _PostBuilderState createState() => _PostBuilderState();
}

class _PostBuilderState extends State<PostBuilder> {
  AutoScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
    print('hello');
  }

  List<Map> extractBody(String body) {
    List<Map> list = [];
    Iterable<RegExpMatch> parsedBody =
        RegExp(r'{([a-zA-Z1-9]*)}([^\{\}]*){\/}').allMatches(body);
    parsedBody.forEach((element) {
      list.add({element.group(1): element.group(2)});
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

  Widget _wrapScrollTag(int index, Widget child) => AutoScrollTag(
        key: ValueKey(index),
        controller: _controller,
        index: index,
        child: child,
        highlightColor: Colors.black.withOpacity(0.1),
      );

  List<Widget> decodeBody(List<Map> extractedBody, BuildContext ctx) {
    print("body");
    var ind = 0;
    final List<Widget> _listWidget = extractedBody.map((m) {
      ind += 1;
      final _key = m.keys.toString().replaceAll(RegExp('[()]'), '');
      final _screenSize = MediaQuery.of(ctx).size;
      String _value = replaceChar(m[_key]);
      switch (_key) {
        case 'p':
          return _wrapScrollTag(ind, Divider());
        case 'text':
          return _wrapScrollTag(
              ind,
              PostElementContainer(
                child: Text(
                  _value,
                ),
                vertPadding: 10,
              ));
        case 'quote':
          return _wrapScrollTag(
              ind,
              PostElementContainer(
                alignment: Alignment.center,
                child: Text(
                  _value,
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                vertPadding: 10,
              ));
        case 'codeS':
          return _wrapScrollTag(
              ind,
              PostElementContainer(
                child: SelectableText(
                  _value,
                  style: TextStyle(fontSize: 16, letterSpacing: 1),
                ),
                vertPadding: 10,
                horPadding: 20,
                background: Theme.of(ctx).primaryColor.withAlpha(30),
              ));
        case 'code':
          return _wrapScrollTag(
              ind,
              PostElementContainer(
                child: Text(
                  _value,
                  style: TextStyle(fontSize: 16, letterSpacing: 1),
                ),
                vertPadding: 10,
                horPadding: 20,
                background: Theme.of(ctx).primaryColor.withAlpha(30),
              ));

        case 'headline4':
          return _wrapScrollTag(
              ind,
              PostElementContainer(
                vertPadding: 20,
                alignment: Alignment.center,
                child: Text(
                  _value,
                  style: Theme.of(ctx).textTheme.headline4,
                ),
              ));
        case 'headline5':
          return _wrapScrollTag(
              ind,
              PostElementContainer(
                vertPadding: 20,
                alignment: Alignment.center,
                child: Text(
                  _value,
                  style: Theme.of(ctx).textTheme.headline5,
                ),
              ));
        case 'headline6':
          return _wrapScrollTag(
              ind,
              PostElementContainer(
                vertPadding: 20,
                alignment: Alignment.center,
                child: Text(
                  _value,
                  style: Theme.of(ctx).textTheme.headline6,
                ),
              ));
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
          return _wrapScrollTag(
              ind,
              PostElementContainer(
                alignment: _alignment,
                vertPadding: 10,
                child: MarkdownBody(
                  data: _str,
                  selectable: false,
                  styleSheet: MarkdownStyleSheet(
                    em: TextStyle(fontWeight: FontWeight.bold, height: 1.5),
                    a: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(ctx)
                            .accentColor), //Theme.of(ctx).textTheme.bodyText2,
                    blockSpacing: 10,
                  ),
                  onTapLink: (text, link, title) {
                    // js.context.callMethod('open', [link]);
                    // _animateToIndex();
                    _controller.scrollToIndex(1000,
                        preferPosition: AutoScrollPosition.begin);
                  },
                ),
              ));
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
          return _wrapScrollTag(
              ind,
              Container(
                alignment: _alignment,
                width: _screenSize.width * 0.6,
                child: AnimatedImage(_path),
              ));
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

          return _wrapScrollTag(
              ind,
              Container(
                alignment: Alignment.center,
                width: _screenSize.width * 0.4,
                child: Table(
                  border: TableBorder.all(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                  children: _tableRows,
                ),
              ));

        default:
          return _wrapScrollTag(ind, Container());
      }
    }).toList();

    return _listWidget;
  }

  @override
  Widget build(BuildContext context) {
    final _postData = Provider.of<PostsModel>(context).postsMap[widget.path];
    final _screenSize = MediaQuery.of(context).size;
    final CollectionReference _bodyRef =
        FirebaseFirestore.instance.collection('posts/${_postData['id']}/body');
    return FutureBuilder<DocumentSnapshot>(
        future: _bodyRef.doc('0').get(),
        builder: (BuildContext ctx, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return SomethingWentWrong();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data.data() == null) return SomethingWentWrong();
          final _extracted = extractBody(snapshot.data.data()['body']);
          final _decoded = decodeBody(_extracted, context);

          return SingleChildScrollView(
            controller: _controller,
            physics: ClampingScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: _screenSize.width,
                    height: _screenSize.height * 0.4,
                    child: FadeInImageAny(
                      imagePath: _postData['image'],
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
                        _postData['title'],
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
                        _postData['date'],
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
                      padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen(context)
                              ? paddingSmall
                              : paddingLarge),
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        iconSize: 34,
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          _controller.animateTo(
                            0,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn,
                          );
                          // scrollToIndex(0,
                          // preferPosition: AutoScrollPosition.begin);
                        },
                        icon: Icon(Icons.arrow_upward),
                      )),
                  Container(
                    child: Footer(),
                  )
                ],
              ),
            ),
          );
        });
  }
}
