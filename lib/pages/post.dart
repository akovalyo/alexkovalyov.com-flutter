import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mysite/models/posts_model.dart';
import 'package:provider/provider.dart';
import 'package:mysite/theme/consts.dart';
import 'package:mysite/layout/screen_size.dart';
import 'package:mysite/widgets/footer.dart';
import 'package:mysite/layout/image_placeholder.dart';
import 'package:mysite/widgets/animated_image.dart';

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

class PostBuilder extends StatelessWidget {
  final String path;

  PostBuilder(this.path);

  List<Map> extractBody(String body) {
    List<Map> list = [];
    Iterable<RegExpMatch> parsedBody =
        RegExp(r'{([a-zA-Z1-9]*)}([ -z|~\n]*){\/}').allMatches(body);
    parsedBody.forEach((element) {
      list.add({element.group(1): element.group(2)});
    });
    return list;
  }

  List<Widget> decodeBody(List<Map> extractedBody, BuildContext ctx) {
    final List<Widget> _listWidget = extractedBody.map((m) {
      final _key = m.keys.toString().replaceAll(RegExp('[()]'), '');
      final _screenSize = MediaQuery.of(ctx).size;
      String _value = m[_key].replaceAll("\\n", "\n");
      _value = _value.replaceAll("\\t", "\t");

      switch (_key) {
        case 'p':
          return Divider();
        case 'text':
          return PostElementContainer(
            child: Text(
              _value,
            ),
            vertPadding: 10,
          );
        case 'codeS':
          return PostElementContainer(
            child: SelectableText(
              _value,
            ),
            vertPadding: 10,
            horPadding: 20,
            background: Theme.of(ctx).primaryColor.withAlpha(30),
          );
        case 'code':
          return PostElementContainer(
            child: Text(
              _value,
              style: TextStyle(fontSize: 16, letterSpacing: 1),
            ),
            vertPadding: 10,
            horPadding: 20,
            background: Theme.of(ctx).primaryColor.withAlpha(30),
          );

        case 'headline4':
          return PostElementContainer(
            vertPadding: 20,
            alignment: Alignment.center,
            child: Text(
              _value,
              style: Theme.of(ctx).textTheme.headline4,
            ),
          );
        case 'headline5':
          return PostElementContainer(
            vertPadding: 20,
            alignment: Alignment.center,
            child: Text(
              _value,
              style: Theme.of(ctx).textTheme.headline5,
            ),
          );
        case 'headline6':
          return PostElementContainer(
            vertPadding: 20,
            alignment: Alignment.center,
            child: Text(
              _value,
              style: Theme.of(ctx).textTheme.headline6,
            ),
          );
        case 'markdown':
          return PostElementContainer(
            vertPadding: 10,
            child: MarkdownBody(
              data: _value,
              selectable: false,
              styleSheet: MarkdownStyleSheet(
                em: Theme.of(ctx).textTheme.bodyText2,
                a: Theme.of(ctx).textTheme.bodyText2,
                del: Theme.of(ctx).textTheme.bodyText2,
                blockSpacing: 10,
              ),
            ),
          );
        case 'image':
          String path = _value;
          final match = RegExp(r'(\[[a-z]+\])([\w\W]+)').firstMatch(path);
          var alignment = Alignment.center;
          String atribute;

          if (match != null) {
            atribute = match.group(1);
            path = match.group(2);
          }
          if (atribute == '[left]') {
            alignment = Alignment.centerLeft;
          } else if (atribute == '[right]') {
            alignment = Alignment.centerRight;
          }
          return Container(
            alignment: alignment,
            width: _screenSize.width * 0.6,
            child: AnimatedImage(path),
          );

        default:
          return Container();
      }
    }).toList();

    return _listWidget;
  }

  @override
  Widget build(BuildContext context) {
    final _postData = Provider.of<PostsModel>(context).postsMap[path];
    final _screenSize = MediaQuery.of(context).size;
    final _extracted = extractBody(_postData['body']);
    final _decoded = decodeBody(_extracted, context);

    return SingleChildScrollView(
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
                ),
                child: Text(
                  _postData['title'],
                  style: Theme.of(context).textTheme.headline4,
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  _postData['date'],
                )),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      isSmallScreen(context) ? paddingSmall : paddingLarge),
              child: Column(
                children: _decoded,
              ),
            ),
            Container(
              child: Footer(),
            )
          ],
        ),
      ),
    );
  }
}
