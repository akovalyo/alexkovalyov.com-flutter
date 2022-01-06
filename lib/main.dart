import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:dynamic_theme/dynamic_theme.dart';

import 'package:mysite/appState.dart';
import 'package:mysite/theme/theme.dart';
import 'package:mysite/theme/dynamic_theme.dart';
import 'package:mysite/consts/routes.dart';
import 'package:mysite/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppState appState = AppState();

  @override
  Widget build(BuildContext context) {
    appState.firebaseInit();
    appState.loadPosts();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: appState),
      ],
      child: DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => akTheme(brightness, null),
        themedWidgetBuilder: (context, theme) => MaterialApp(
          title: 'Alex Kovalyov',
          debugShowCheckedModeBanner: false,
          theme: theme,
          initialRoute: null,
          navigatorKey: navKey,
          onGenerateRoute: generateRoute,
        ),
      ),
    );
  }
}
