import 'package:flutter/material.dart';

import 'package:mysite/pages/home.dart';
import 'package:mysite/pages/home2.dart';
import 'package:mysite/pages/page404.dart';
import 'package:mysite/router/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  if (routes[settings.name] == null) return _getPageRoute(Page404(), settings);
  return _getPageRoute(routes[settings.name], settings);
  // switch (settings.name) {
  //   case routeHome:
  //     return _getPageRoute(HomePage(), settings);
  //   case routeScroll:
  //     return _getPageRoute(Example(), settings);
  //   case routeHome2:
  //     return _getPageRoute(HomePage2(), settings);
  // }
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
