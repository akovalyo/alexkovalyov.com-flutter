import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

import 'package:mysite/helpers.dart';
import 'package:mysite/router/routes.dart';
import 'package:mysite/consts/consts.dart';
import 'package:mysite/consts/menu_items_list.dart';
import 'package:mysite/widgets/menu.dart';
import 'package:mysite/widgets/hover_icon_button.dart';
import 'package:mysite/widgets/menu_icon.dart';
import 'package:mysite/widgets/menu_item.dart';
import 'package:mysite/widgets/overlay_menu.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class AkAppBar extends StatelessWidget {
  final AutoScrollController scrollController;

  AkAppBar(this.scrollController);
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
        onPressed: () {
          final newRouteName = routeHome;
          bool isSameRoute = false;
          navKey.currentState.popUntil((route) {
            if (route.settings.name == newRouteName) {
              isSameRoute = true;
            }
            return true;
          });

          if (!isSameRoute) {
            navKey.currentState.pushNamed(routeHome);
          }
        }, //, arguments: title);

        imageProvider: AssetImage('assets/images/main/akM.png'),
        firstColor: Theme.of(context).secondaryHeaderColor,
        secondColor: Theme.of(context).accentColor,
        // ),
      ),
    );
    return isSmallScreen(context)
        ? AppBar(
            centerTitle: true,
            toolbarHeight: appBarHeight,
            leading: MenuIcon(),
            title: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: HoverIconButton(
                onPressed: () {
                  final _isSameRoute = isSameRoot(routeHome);

                  if (_isSameRoute) {
                    scrollController.animateTo(
                      0,
                      duration: Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                    );
                  } else {
                    navKey.currentState.pushNamed(routeHome);
                  }
                },

                imageProvider: AssetImage('assets/images/main/akM.png'),
                firstColor: Theme.of(context).secondaryHeaderColor,
                secondColor: Theme.of(context).accentColor,
                // ),
              ),
            ),
          )
        // Container(
        //     color: Theme.of(context).primaryColor,
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: appBarPadding),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: <Widget>[
        //           Expanded(
        //             child: _drawerIcon,
        //           ),
        //           Expanded(
        //             child: _mainIcon,
        //           ),
        //           Expanded(
        //             child: Container(
        //               alignment: Alignment.centerRight,
        //               child: Container(),
        //               // OverlayMenu(
        //               //   backgroundColor: Theme.of(context).primaryColor,
        //               //   links: _menuItems,
        //               //   onChange: (index) {
        //               //     // final newRouteName = '/';
        //               //     // bool isSameRoute = false;
        //               //     // navKey.currentState.popUntil((route) {
        //               //     //   if (route.settings.name == newRouteName) {
        //               //     //     isSameRoute = true;
        //               //     //   }
        //               //     //   return true;
        //               //     // });

        //               //     // if (isSameRoute) {
        //               //     //   navKey.currentState.pushReplacementNamed(
        //               //     //       menuItems[index]['path'],
        //               //     //       arguments: menuItems[index]['title']);
        //               //     // } else
        //               //     //   navKey.currentState.pushNamed(
        //               //     //       menuItems[index]['path'],
        //               //     //       arguments: menuItems[index]['title']);
        //               //   },
        //               // ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   )
        : AppBar(
            centerTitle: true,
            toolbarHeight: appBarHeight,
            leading: MenuIcon(),
            title: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: HoverIconButton(
                onPressed: () {
                  final _isSameRoute = isSameRoot(routeHome);

                  if (_isSameRoute) {
                    scrollController.animateTo(
                      0,
                      duration: Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                    );
                  } else {
                    navKey.currentState.pushNamed(routeHome);
                  }
                },

                imageProvider: AssetImage('assets/images/main/akM.png'),
                firstColor: Theme.of(context).secondaryHeaderColor,
                secondColor: Theme.of(context).accentColor,
                // ),
              ),
            ),
          );

    // Container(
    //     color: Theme.of(context).primaryColor,
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: appBarPadding),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: <Widget>[
    //           Expanded(
    //             child: Container(
    //               child: _drawerIcon,
    //             ),
    //           ),
    //           Expanded(
    //             child: _mainIcon,
    //           ),
    //           Expanded(
    //             child: AkMenu(fontSize: 18.0, isColumn: false),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
  }
}
