import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:flutter/rendering.dart';

class MenuIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HoverCrossFadeWidget(
      cursor: SystemMouseCursors.click,
      firstChild: IconButton(
        color: Colors.white,
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      secondChild: IconButton(
        color: Theme.of(context).accentColor,
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      duration: Duration(milliseconds: 500),
      firstCurve: Curves.easeInCirc,
    );
  }
}
