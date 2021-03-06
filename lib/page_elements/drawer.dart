import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
// import 'package:dynamic_theme/dynamic_theme.dart';

import 'package:mysite/theme/dynamic_theme.dart';
import 'package:mysite/helpers.dart';
import 'package:mysite/consts/routes.dart';
import 'package:mysite/widgets/menu.dart';
import 'package:mysite/widgets/hover_icon_button.dart';
import 'package:mysite/widgets/choice_chip.dart';
import 'package:mysite/widgets/account_menu.dart';

class AkDrawer extends StatelessWidget {
  final AutoScrollController? controller;

  AkDrawer({this.controller});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;

    FocusScope.of(context).unfocus();
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
                      color: Theme.of(context).secondaryHeaderColor,
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
                          final _currRoot = currentRoot();
                          if (homePage.contains(_currRoot) &&
                              controller != null) {
                            FocusScope.of(context).unfocus();
                            controller!.animateTo(
                              0,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                            );
                          } else {
                            navKey.currentState!.pushNamed(routeHome);
                          }
                          Scaffold.of(context).openEndDrawer();
                        },
                        imageProvider: AssetImage('assets/images/main/akM.png'),
                        firstColor: Theme.of(context).secondaryHeaderColor,
                        secondColor: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: AkMenu(
                    controller: controller == null ? null : controller,
                    fontSize: 18.0,
                    isColumn: true,
                  )),
            ),
            Container(
              padding: const EdgeInsets.only(top: 7),
              child: AccountMenu(),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 10),
              child: Text('Select Theme',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Theme.of(context).secondaryHeaderColor)),
            ),
            Container(
              alignment: Alignment.center,
              child: ThemeChoiceChip(onSelectedTheme: (brightness) {
                DynamicTheme.of(context)!.setBrightness(brightness);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
