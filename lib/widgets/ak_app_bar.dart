import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/rendering.dart';

import 'package:mysite/layout/screen_size.dart';
import 'package:mysite/router/routes.dart';
import 'package:mysite/consts/consts.dart';
import 'package:mysite/models/menu_model.dart';
import 'package:mysite/models/scroll.dart';
import 'package:mysite/widgets/hover_icon_button.dart';
import 'package:mysite/widgets/menu_icon.dart';

class AkAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _menu = Provider.of<AkMenu>(context, listen: false);
    //final _opacity = Provider.of<Scroll>(context).opacity;
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
                    child: Container(),
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
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: _menu.getMenuList(18.0, false),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
