import 'package:flutter/material.dart';

import 'package:mysite/widgets/menu.dart';
import 'package:mysite/layout/screen_size.dart';

class AkDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _screenHeight = screenSize(context).height;

    return Drawer(
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
                  color: Theme.of(context).primaryColorDark,
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
        ],
      ),
    );
  }
}
