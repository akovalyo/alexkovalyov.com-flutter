import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mysite/layout/screen_size.dart';
import 'package:mysite/layout/image_placeholder.dart';
import 'package:mysite/router/routes.dart';
import 'package:mysite/theme/consts.dart';
import 'package:mysite/widgets/overlay_menu.dart';
import 'package:mysite/theme/change_theme.dart';
import 'package:mysite/models/menu_model.dart';
import 'package:mysite/models/scroll.dart';

class AkAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menu = Provider.of<AkMenu>(context, listen: false);
    final opacity = Provider.of<Scroll>(context).opacity;
    final _mainIcon = Container(
      alignment: Alignment.center,
      child: FlatButton(
        splashColor: Color(0x00000000),
        hoverColor: Color(0x00000000),
        onPressed: () => navKey.currentState.pushNamed(routeHome),
        child: FadeInImageAny(
          image: AssetImage(mainImage),
          placeholder: SizedBox(
            width: 40,
            height: 60,
          ),
          width: 40,
          height: 60,
        ),
      ),
    );
    print("opacity: $opacity");
    return isSmallScreen(context)
        ? Container(
            color: Theme.of(context).primaryColor.withOpacity(opacity),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: appBarPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Builder(
                        builder: (BuildContext context) {
                          return IconButton(
                            icon: const Icon(Icons.menu),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          );
                        },
                      ),
                    ),
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
            color: Theme.of(context).primaryColor.withOpacity(opacity),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: appBarPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  Expanded(
                    child: _mainIcon,
                  ),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: menu.getMenuList(18.0, false),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.centerLeft,
                    child: OverlayMenu(
                      icons: [
                        Icon(Icons.brightness_6_outlined),
                      ],
                      backgroundColor: Theme.of(context).primaryColor,
                      iconColor: Theme.of(context).iconTheme.color,
                      onChange: (index) {
                        if (index == 0) {
                          changeTheme(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
