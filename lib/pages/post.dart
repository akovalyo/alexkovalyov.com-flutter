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
        RegExp(r'<([a-zA-Z]*)>([ -;=?-~\n]*)<\/[a-z]*>').allMatches(body);
    parsedBody.forEach((element) {
      list.add({element.group(1): element.group(2)});
    });
    return list;
  }

  List<Widget> decodeBody(List<Map> extractedBody, BuildContext ctx) {
    final List<Widget> _listWidget = extractedBody.map((m) {
      final key = m.keys.toString().replaceAll(RegExp('[()]'), '');
      final _screenSize = MediaQuery.of(ctx).size;
      switch (key) {
        case 'p':
          return Divider();
        case 'text':
          return PostElementContainer(
            child: Text(
              m[key],
            ),
            vertPadding: 10,
          );
        case 'codeS':
          return PostElementContainer(
            child: SelectableText(
              m[key],
            ),
            vertPadding: 10,
            horPadding: 20,
            background: Theme.of(ctx).primaryColor.withAlpha(30),
          );
        case 'code':
          return PostElementContainer(
            child: Text(
              m[key],
              style: TextStyle(fontSize: 16, letterSpacing: 1),
            ),
            vertPadding: 10,
            horPadding: 20,
            background: Theme.of(ctx).primaryColor.withAlpha(30),
          );

        case 'headline1':
          return PostElementContainer(
            vertPadding: 20,
            alignment: Alignment.center,
            child: Text(
              m[key],
              style: Theme.of(ctx).textTheme.headline1,
            ),
          );
        case 'headline2':
          return Text(m[key]);
        case 'markdown':
          // return Text(m[key]);
          return PostElementContainer(
            vertPadding: 10,
            child: MarkdownBody(
              data: m[key],
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
          print(m[key]);
          String path = m[key];
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
    //print(_postBody);
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: _screenSize.width,
              height: _screenSize.height * 0.4,
              child: FadeInImageAny(
                image: NetworkImage(_postData['image']),
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
              padding: EdgeInsets.symmetric(
                  horizontal:
                      isSmallScreen(context) ? paddingSmall : paddingLarge),
              child: Column(
                children: decodeBody(_extracted, context),
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
