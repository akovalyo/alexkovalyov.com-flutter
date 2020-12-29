import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:flutter/rendering.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      child: HoverCrossFadeWidget(
        cursor: SystemMouseCursors.click,
        firstChild: IconButton(
          color: Theme.of(context).secondaryHeaderColor,
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
      ),
    );
  }
}
