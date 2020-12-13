import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mysite/layout/screen_size.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:mysite/widgets/choice_chip.dart';
import 'package:mysite/layout/image_placeholder.dart';
import 'package:mysite/consts/consts.dart';
import 'package:mysite/models/menu_model.dart';
import 'package:mysite/router/routes.dart';
import 'package:mysite/widgets/main_icon.dart';

class AkDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _menu = Provider.of<AkMenu>(context, listen: false);
    var _screenHeight = screenSize(context).height;

    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColorDark,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: _screenHeight * 0.25,
              child: Stack(
                children: [
                  Container(
                    color: Color(0xFF202020),
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close_sharp),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      child: FlatButton(
                        splashColor: Color(0x00000000),
                        hoverColor: Color(0x00000000),
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                          navKey.currentState.pushNamed(routeHome);
                        },
                        child: MainIcon(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: _menu.getMenuList(18.0, true),
                ),
              ),
            ),
            Divider(),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 10),
              child: Text('Select Theme',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Theme.of(context).secondaryHeaderColor)),
            ),
            Container(
              alignment: Alignment.center,
              child: ThemeChoiceChip(onSelectedTheme: (brightness) {
                DynamicTheme.of(context).setBrightness(brightness);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
