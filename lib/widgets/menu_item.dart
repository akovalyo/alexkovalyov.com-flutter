import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hovering/hovering.dart';

import 'package:mysite/router/routes.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String path;
  final double fontSize;
  final bool column;
  final bool overlayMenu;

  const MenuItem({
    @required this.title,
    @required this.path,
    this.fontSize,
    this.column,
    this.overlayMenu = false,
  });

  @override
  Widget build(BuildContext context) {
    return overlayMenu
        ? Container(
            alignment: Alignment.center,
            child: HoverCrossFadeWidget(
              cursor: SystemMouseCursors.click,
              firstChild: Text(
                title,
                style: TextStyle(
                  fontSize: fontSize,
                  color: Theme.of(context).textTheme.button.color,
                ),
              ),
              secondChild: Text(
                title,
                style: TextStyle(
                  fontSize: fontSize,
                  color: Theme.of(context).accentColor,
                ),
              ),
              duration: Duration(milliseconds: 200),
            ),
          )
        : Container(
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
                final newRouteName = '/';
                bool isSameRoute = false;
                navKey.currentState.popUntil((route) {
                  if (route.settings.name == newRouteName) {
                    isSameRoute = true;
                  }
                  return true;
                });

                if (isSameRoute) {
                  navKey.currentState
                      .pushReplacementNamed(path, arguments: title);
                } else
                  navKey.currentState.pushNamed(path, arguments: title);
                if (column) {
                  Scaffold.of(context).openEndDrawer();
                }
              },
            ),
          );
  }
}
