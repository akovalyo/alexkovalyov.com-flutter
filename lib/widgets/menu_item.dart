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
      padding: column ? EdgeInsets.only(bottom: 10, top: 10) : null,
      child: HoverButton(
        child: Text(title,
            style: TextStyle(
              fontSize: fontSize,
            )),
        textColor: Theme.of(context).textTheme.bodyText2.color,
        hoverTextColor: Colors.red,
        hoverElevation: 0,
        focusElevation: 0,
        hoverColor: Color(0x00000000),
        highlightColor: Color(0x00000000),
        disabledColor: Color(0x00000000),
        focusColor: Color(0x00000000),
        splashColor: Color(0x00000000),

        onpressed: () {
          navKey.currentState.pushNamed(path);
          if (column) {
            Scaffold.of(context).openEndDrawer();
          }
        },

        // child: FlatButton(

        //   onPressed: () {
        //     navKey.currentState.pushNamed(path);
        //     if (column) {
        //       Scaffold.of(context).openEndDrawer();
        //     }
        //   },
        //   child: Text(
        //     title,
        //     style: TextStyle(fontSize: fontSize, color: Colors.white),
        //   ),
        // ),
      ),
    );
  }
}
