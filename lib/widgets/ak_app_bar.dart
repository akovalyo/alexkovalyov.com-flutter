import 'package:flutter/material.dart';

import 'package:mysite/layout/adaptive.dart';
import 'package:mysite/layout/image_placeholder.dart';
import 'package:mysite/widgets/menu.dart';
import 'package:mysite/router/routes.dart';
import 'package:mysite/theme/consts.dart';
import 'package:mysite/widgets/overlay_menu.dart';

class AkAppBar extends StatelessWidget {
  final double opacity;

  AkAppBar(this.opacity);

  @override
  Widget build(BuildContext context) {
    // bool showMenu = false;
    // OverlayEntry overlayEntry = showWeixinButtonView();

    const String _image = 'assets/images/site/akM.png';
    final Widget _mainIcon = Container(
      alignment: Alignment.center,
      child: FlatButton(
        splashColor: Color(0x00000000),
        hoverColor: Color(0x00000000),
        onPressed: () => navKey.currentState.pushNamed(routeHome),
        child: FadeInImageAny(
          image: AssetImage(_image),
          placeholder: SizedBox(
            width: 40,
            height: 60,
          ),
          width: 40,
          height: 60,
        ),
      ),
    );

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
                    child: AkMenu(18).row(),
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
                        print(index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
