import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:refined_markdown/refined_markdown.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mysite/models/posts_model.dart';
import 'package:provider/provider.dart';

import 'package:mysite/theme/consts.dart';
import 'package:mysite/layout/screen_size.dart';
import 'package:mysite/widgets/footer.dart';
import 'package:mysite/layout/image_placeholder.dart';
import 'package:mysite/router/routes.dart';

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

  List<Widget> decodeBody(String body) {
    final List decodedData = json.decode(body)["body"];
    //print(decodedData[0]['text']);

    final List<Widget> _listWidget = decodedData.map((m) {
      final key = m.keys.toString().replaceAll(RegExp('[()]'), '');
      final ctx = navKey.currentState.context;
      switch (key) {
        case 'text':
          return PostElementContainer(
            child: Text(m[key]),
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
                blockSpacing: 10,
              ),
            ),
          );

        default:
          return Container();
      }
    }).toList();

    //_listWidget.add(Footer());
    print(_listWidget);
    return _listWidget;
  }

  @override
  Widget build(BuildContext context) {
    final _postData = Provider.of<PostsModel>(context).postsMap[path];
    final _screenSize = MediaQuery.of(context).size;
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
                children: decodeBody(_postData['body']),
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
