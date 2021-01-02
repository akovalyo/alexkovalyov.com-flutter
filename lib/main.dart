import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mysite/theme/theme.dart';
import 'package:mysite/models/posts_model.dart';
import 'package:mysite/consts/routes.dart';
import 'package:mysite/route_generator.dart';
import 'package:mysite/pages/something_wrong.dart';
import 'package:mysite/pages/waiting_screen.dart';
import 'package:mysite/pages/post_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          final Query postsRef = FirebaseFirestore.instance.collection('posts');

          return FutureBuilder<QuerySnapshot>(
            future: postsRef.orderBy('date', descending: true).get(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) {
                return SomethingWentWrong();
              }
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, Map> dbPosts = {};
                snapshot.data.docs.forEach((pst) {
                  dbPosts[pst.data()['path']] = pst.data();
                });
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

                      //builder: (context, child) => HomePage(routeHome),
                      initialRoute: routeHome,

                      navigatorKey: navKey,
                      onGenerateRoute: generateRoute,
                    ),
                  ),
                );
              }
              return WaitingScreen();
            },
          );
        }
        return WaitingScreen();
      },
    );
  }
}
