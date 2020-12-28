import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

import 'package:mysite/helper/screen_size.dart';
import 'package:mysite/router/routes.dart';
import 'package:mysite/consts/consts.dart';
import 'package:mysite/consts/menu_items_list.dart';
import 'package:mysite/widgets/menu.dart';
import 'package:mysite/widgets/hover_icon_button.dart';
import 'package:mysite/widgets/menu_icon.dart';
import 'package:mysite/widgets/menu_item.dart';
import 'package:mysite/widgets/overlay_menu.dart';

class AkAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _menuItems = menuItems.map((elem) {
      return MenuItem(
        title: elem['title'],
        path: elem['path'],
        fontSize: 12,
        column: false,
        overlayMenu: true,
      );
    }).toList();

    final _drawerIcon = Container(
      alignment: Alignment.centerLeft,
      child: Builder(
        builder: (BuildContext context) {
          return MenuIcon();
        },
      ),
    );
    final _mainIcon = Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      child: HoverIconButton(
        onPressed: () => navKey.currentState.pushNamed(routeHome),
        imageProvider: AssetImage('assets/images/main/akM.png'),
        secondColor: Theme.of(context).accentColor,
        // ),
      ),
    );
    return isSmallScreen(context)
        ? Container(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: appBarPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: _drawerIcon,
                  ),
                  Expanded(
                    child: _mainIcon,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: OverlayMenu(
                        backgroundColor: Theme.of(context).primaryColor,
                        links: _menuItems,
                        onChange: (index) {
                          final newRouteName = '/';
                          bool isSameRoute = false;
                          navKey.currentState.popUntil((route) {
                            if (route.settings.name == newRouteName) {
                              isSameRoute = true;
                            }
                            return true;
                          });

                          if (isSameRoute) {
                            navKey.currentState.pushReplacementNamed(
                                menuItems[index]['path'],
                                arguments: menuItems[index]['title']);
                          } else
                            navKey.currentState.pushNamed(
                                menuItems[index]['path'],
                                arguments: menuItems[index]['title']);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: appBarPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: _drawerIcon,
                    ),
                  ),
                  Expanded(
                    child: _mainIcon,
                  ),
                  Expanded(
                    child: AkMenu(fontSize: 18.0, isColumn: false),
                  ),
                ],
              ),
            ),
          );
  }
}
