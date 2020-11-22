import 'package:flutter/material.dart';

import 'package:mysite/theme/adaptive.dart';

class AkAppBar extends StatefulWidget {
  final double opacity;

  AkAppBar(this.opacity);

  @override
  _AkAppBarState createState() => _AkAppBarState();
}

class _AkAppBarState extends State<AkAppBar> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return isSmallScreen(context)
        ? AppBar(
            backgroundColor: Theme.of(context).primaryColor,
          )
        : Container(
            color: Theme.of(context).primaryColor,
          );
  }
}
