import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mysite/pages/page404.dart';
import 'package:mysite/router/routes.dart';
import 'package:mysite/pages/posts_page.dart';
import 'package:mysite/models/posts_model.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final _postsModel =
      Provider.of<PostsModel>(navKey.currentState.context, listen: false);
  if (_postsModel.postExist(settings.name)) {
    return _getPageRoute(
      PostPage(settings.name),
      settings,
    );
  }
  if (routes[settings.name] == null) {
    return _getPageRoute(Page404(), settings);
  }
  return _getPageRoute(
    routes[settings.name],
    settings,
  );
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return PageRouteBuilder(
    settings: RouteSettings(name: settings.name),
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
