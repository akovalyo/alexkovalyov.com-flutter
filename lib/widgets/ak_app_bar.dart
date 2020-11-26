import 'package:flutter/material.dart';

import 'package:mysite/layout/adaptive.dart';
import 'package:mysite/layout/image_placeholder.dart';
import 'package:mysite/widgets/menu.dart';
import 'package:mysite/router/routes.dart';

class AkAppBar extends StatelessWidget {
  final double opacity;

  AkAppBar(this.opacity);

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(horizontal: 40),
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
              padding: const EdgeInsets.symmetric(horizontal: 40),
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
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
