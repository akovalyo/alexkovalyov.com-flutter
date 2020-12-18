import 'package:flutter/material.dart';

import 'package:mysite/router/routes.dart';
import 'package:hovering/hovering.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String path;
  final double fontSize;
  final bool column;

  const MenuItem({
    @required this.title,
    @required this.path,
    this.fontSize,
    this.column,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: column ? const EdgeInsets.only(bottom: 10, top: 10) : null,
      child: HoverButton(
        height: 1,
        padding: const EdgeInsets.all(1),
        child: Text(title,
            style: TextStyle(
              fontSize: fontSize,
            )),
        textColor: Theme.of(context).textTheme.button.color,
        hoverTextColor: Theme.of(context).accentColor,
        hoverElevation: 0,
        focusElevation: 0,
        hoverColor: Color(0x00000000),
        highlightColor: Color(0x00000000),
        splashColor: Color(0x00000000),
        onpressed: () {
          navKey.currentState.pushNamed(path);
          if (column) {
            Scaffold.of(context).openEndDrawer();
          }
        },
      ),
    );
  }
}
