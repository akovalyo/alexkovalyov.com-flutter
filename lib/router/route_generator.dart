import 'package:flutter/material.dart';

import 'package:mysite/pages/home.dart';
import 'package:mysite/pages/home2.dart';
import 'package:mysite/pages/scroll.dart';
import 'package:mysite/router/routes.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case routeHome:
//         return MaterialPageRoute(builder: (_) => HomePage());
//       case routeScroll:
//         return MaterialPageRoute(builder: (_) => Example());
//     }
//   }
// }

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routeHome:
      return _getPageRoute(HomePage(), settings);
    case routeScroll:
      return _getPageRoute(Example(), settings);
    case routeHome2:
      return _getPageRoute(HomePage2(), settings);
  }
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
