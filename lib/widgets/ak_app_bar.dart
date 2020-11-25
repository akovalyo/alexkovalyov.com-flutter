import 'package:flutter/material.dart';

import 'package:mysite/theme/adaptive.dart';
import 'package:mysite/theme/image_placeholder.dart';
import 'package:mysite/widgets/menu.dart';

class AkAppBar extends StatelessWidget {
  final double opacity;

  AkAppBar(this.opacity);

  @override
  Widget build(BuildContext context) {
    const String _image = 'assets/images/site/akM.png';
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
                            color: Theme.of(context).primaryIconTheme.color,
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
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
                    child: Container(
                      alignment: Alignment.center,
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
                  ),
                  Expanded(
                    child: AkMenu(18).row(),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      color: Theme.of(context).primaryIconTheme.color,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
