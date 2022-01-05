import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:dynamic_theme/dynamic_theme.dart';

import 'package:mysite/appState.dart';
import 'package:mysite/theme/theme.dart';
import 'package:mysite/theme/dynamic_theme.dart';
import 'package:mysite/models/posts_model.dart';
import 'package:mysite/consts/routes.dart';
import 'package:mysite/route_generator.dart';

void main() {
  // final Auth _auth = Auth();
  // await _auth.firebaseInit();
  // Map<String, Map> _dbPosts = await _auth.loadDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppState appState = AppState();

  @override
  Widget build(BuildContext context) {
    appState.firebaseInit();
    appState.loadDb();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostsModel(null), //TODO
        ),
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
