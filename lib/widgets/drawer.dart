import 'package:flutter/material.dart';

import 'package:mysite/widgets/menu.dart';
import 'package:mysite/layout/screen_size.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:mysite/widgets/choice_chip.dart';

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
            // DrawerHeader(
            //   decoration:
            //       BoxDecoration(color: Theme.of(context).primaryColorDark),
            //   child: Column(
            //     children: [
            //       Container(
            //         alignment: Alignment.bottomRight,
            //         child: IconButton(
            //           icon: Icon(Icons.close_fullscreen_outlined),
            //           onPressed: () => Scaffold.of(context).openEndDrawer(),
            //         ),
            //       ),
            //       Center(
            //         child: Text('Alex Kovalyov'),
            //       ),
            //     ],
            //   ),
            // ),

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
                    child: Text('Alex Kovalyov'),
                  ),
                ],
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: AkMenu(24).column(),
              ),
            ),

            Container(
              alignment: Alignment.center,
              child: ThemeChoiceChip(onSelectedTheme: (brightness) {
                DynamicTheme.of(context).setBrightness(brightness);
              }),
            ),
            // BrightnessSwitcherDialog(
            //   onSelectedTheme: (brightness) {
            //     DynamicTheme.of(context).setBrightness(brightness);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
