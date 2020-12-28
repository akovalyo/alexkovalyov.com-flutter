import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import 'package:mysite/helper/screen_size.dart';
import 'package:mysite/router/routes.dart';
import 'package:mysite/widgets/choice_chip.dart';
import 'package:mysite/widgets/menu.dart';
import 'package:mysite/widgets/hover_icon_button.dart';

class AkDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      child: HoverIconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                          navKey.currentState.pushNamed(routeHome);
                        },
                        imageProvider: AssetImage('assets/images/main/akM.png'),
                        secondColor: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: AkMenu(fontSize: 18.0, isColumn: true)),
            ),
            Divider(),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 10),
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
