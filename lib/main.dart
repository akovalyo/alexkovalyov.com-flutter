import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import 'package:mysite/auth.dart';
import 'package:mysite/theme/theme.dart';
import 'package:mysite/models/posts_model.dart';
import 'package:mysite/consts/routes.dart';
import 'package:mysite/route_generator.dart';
import 'package:mysite/pages/page404.dart';

void main() async {
  final Auth _auth = Auth();
  await _auth.firebaseInit();
  Map<String, Map> _dbPosts = await _auth.loadDb();
  runApp(MyApp(_dbPosts));
}

class MyApp extends StatelessWidget {
  final Map<String, Map> dbPosts;
  MyApp(this.dbPosts);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostsModel(dbPosts),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => AkMenu(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => Scroll(),
        // ),
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
