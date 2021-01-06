import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'package:mysite/consts/routes.dart';
import 'package:mysite/models/posts_model.dart';
import 'package:mysite/pages/post_page.dart';
import 'package:mysite/pages/page404.dart';
import 'package:mysite/pages/template_basic.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final _postsModel =
      Provider.of<PostsModel>(navKey.currentState.context, listen: false);
  if (_postsModel.postExist(settings.name)) {
    // changeTitle(_postsModel.postsMap[settings.name]['title']);
    return _getPageRoute(
      PostPage(settings.name),
      settings,
    );
  }
  if (routes[settings.name] == null) {
    // changeTitle('404 - Page not found');
    return _getPageRoute(TemplateBasic(Page404()), settings);
  }
  // changeTitle(settings.name);
  return _getPageRoute(
    routes[settings.name],
    settings,
  );
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return PageRouteBuilder(
    settings: RouteSettings(name: settings.name, arguments: settings.arguments),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.linear,
      );
      return FadeTransition(
        opacity: curvedAnimation,
        child: child,
      );
    },
  );
}
