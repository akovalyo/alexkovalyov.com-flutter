import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mysite/pages/home.dart';
import 'package:mysite/theme/theme.dart';
import 'package:mysite/pages/scroll.dart';
import 'package:mysite/pages/template.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alex Kovalyov',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: LayoutTemplate(child: HomePage()),
      routes: {
        Example.routeName: (ctx) => Example(),
      },
    );
  }
}
