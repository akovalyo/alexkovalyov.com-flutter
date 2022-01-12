import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes.dart';
import '../models/app_state.dart';
import '../pages/post_page.dart';
import '../pages/page404.dart';
import '../pages/basic_page_template.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final appState =
      Provider.of<AppState>(navKey.currentState!.context, listen: false);
  String path = settings.name ?? '';
  if (appState.postExists(path)) {
    return _getPageRoute(
      PostPage(appState.getPostByPath(path)),
      settings,
    );
  }

  Rt? route = Routes.contains(settings.name);
  if (route != null) {
    return _getPageRoute(
      route.widget(),
      settings,
    );
  }
  return _getPageRoute(BasicPageTemplate(Page404()), settings);
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
