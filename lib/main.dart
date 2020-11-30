import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mysite/router/route_generator.dart';
import 'package:mysite/theme/theme.dart';
import 'package:mysite/pages/template.dart';
import 'package:mysite/router/routes.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mysite/pages/something_wrong.dart';
import 'package:mysite/pages/waiting_screen.dart';
import 'package:mysite/widgets/main_inherited.dart';

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
          List posts = [];

          return FutureBuilder<QuerySnapshot>(
            future: postsRef.get(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) {
                return SomethingWentWrong();
              }
              if (snapshot.connectionState == ConnectionState.done) {
                snapshot.data.docs.forEach((pst) {
                  posts.add(pst.data());
                });
                return DynamicTheme(
                  defaultBrightness: Brightness.light,
                  data: (brightness) => akTheme(brightness),
                  themedWidgetBuilder: (context, theme) => MaterialApp(
                    title: 'Alex Kovalyov',
                    debugShowCheckedModeBanner: false,
                    theme: theme,
                    builder: (context, child) => MainInheritedWidget(
                      posts,
                      child,
                      LayoutTemplate(),
                    ),
                    initialRoute: routeHome,
                    navigatorKey: navKey,
                    onGenerateRoute: generateRoute,
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
