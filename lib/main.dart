import 'package:flutter/material.dart';

import 'package:mysite/router/route_generator.dart';
import 'package:mysite/theme/theme.dart';
import 'package:mysite/pages/template.dart';
import 'package:mysite/router/routes.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => akTheme(brightness),
      themedWidgetBuilder: (context, theme) => MaterialApp(
        title: 'Alex Kovalyov',
        debugShowCheckedModeBanner: false,
        theme: theme,
        builder: (context, child) => LayoutTemplate(
          child: child,
        ),
        initialRoute: routeHome,
        navigatorKey: navKey,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
