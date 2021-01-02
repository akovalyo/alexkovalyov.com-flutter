import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hovering/hovering.dart';

import 'package:mysite/consts/routes.dart';
import 'package:mysite/helpers.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String path;
  final AutoScrollController controller;
  final double fontSize;
  final bool column;

  const MenuItem({
    @required this.title,
    @required this.path,
    @required this.controller,
    this.fontSize,
    this.column,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: column
          ? const EdgeInsets.symmetric(vertical: 10)
          : const EdgeInsets.symmetric(horizontal: 1),
      child: HoverButton(
        height: 1,
        padding: const EdgeInsets.all(1),
        child: Text(title,
            style: TextStyle(
              fontSize: fontSize,
            )),
        textColor: Theme.of(context).secondaryHeaderColor,
        hoverTextColor: Theme.of(context).accentColor,
        hoverElevation: 0,
        focusElevation: 0,
        hoverColor: Color(0x00000000),
        highlightColor: Color(0x00000000),
        splashColor: Color(0x00000000),
        onpressed: () {
          final _currRoot = currentRoot();
          if (homePage.contains(_currRoot)) {
            controller.scrollToIndex(
              homeWidgets[title],
              duration: Duration(milliseconds: 500),
              preferPosition: AutoScrollPosition.begin,
            );
          } else {
            navKey.currentState.pushNamed(path);
          }
          if (column) {
            Scaffold.of(context).openEndDrawer();
          }
        },
      ),
    );
  }
}
