import 'package:flutter/material.dart';

import 'package:mysite/pages/home.dart';
import 'package:mysite/pages/scroll.dart';
import 'package:mysite/router/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(builder: (_) => HomePage());
      case routeScroll:
        return MaterialPageRoute(builder: (_) => Example());
    }
  }
}
