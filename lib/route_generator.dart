import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mysite/consts/routes.dart';
import 'appState.dart';
import 'package:mysite/pages/post_page.dart';
import 'package:mysite/pages/page404.dart';
import 'package:mysite/pages/template_basic.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final appState =
      Provider.of<AppState>(navKey.currentState!.context, listen: false);

  String path = settings.name ?? '';
  if (appState.postExists(path)) {
    print(settings.name);
    return _getPageRoute(
      PostPage(appState.getPostByPath(path)),
      settings,
    );
  }
  if (routes[settings.name] == null) {
    return _getPageRoute(TemplateBasic(Page404()), settings);
  }
  return _getPageRoute(
    routes[settings.name]!,
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
