import 'package:flutter/material.dart';

import 'package:mysite/pages/home.dart';
import 'package:mysite/router/route_generator.dart';
import 'package:mysite/theme/theme.dart';
import 'package:mysite/pages/scroll.dart';
import 'package:mysite/pages/template.dart';
import 'package:mysite/router/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alex Kovalyov',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      builder: (context, child) => LayoutTemplate(
        child: child,
      ),
      initialRoute: routeHome,
      navigatorKey: navKey,
      onGenerateRoute: RouteGenerator.generateRoute,

      // home: LayoutTemplate(child: HomePage()),
      // routes: {
      //   Example.routeName: (ctx) => Example(),
      // },
    );
  }
}
