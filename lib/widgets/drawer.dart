import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mysite/layout/screen_size.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:mysite/widgets/choice_chip.dart';
import 'package:mysite/layout/image_placeholder.dart';
import 'package:mysite/theme/consts.dart';
import 'package:mysite/models/menu_model.dart';

class AkDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menu = Provider.of<AkMenu>(context, listen: false);
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
                    child: FadeInImageAny(
                      image: AssetImage(mainImage),
                      placeholder: SizedBox(
                        width: 80,
                        height: 80,
                      ),
                      width: 80,
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: menu.getMenuList(18.0, true),
                ),
              ),
            ),
            Divider(),

            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Select Theme',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
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
