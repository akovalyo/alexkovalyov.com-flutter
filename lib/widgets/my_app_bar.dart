import 'package:flutter/material.dart';

import 'package:mysite/theme/adaptive.dart';

class MyAppBar extends StatefulWidget {
  final double opacity;

  MyAppBar(this.opacity);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return isSmallScreen(context)
        ? AppBar()
        : Container(
            color: Colors.black,
          );
  }
}
