import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mysite/widgets/ak_app_bar.dart';
import 'package:mysite/widgets/drawer.dart';
import 'package:mysite/layout/screen_size.dart';
import 'package:mysite/consts/consts.dart';
import 'package:mysite/models/scroll.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;

  LayoutTemplate({Key key, @required this.child});

  @override
  Widget build(BuildContext context) {
    var _screenSize = screenSize(context);
    //var _scrollData = Provider.of<Scroll>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      //extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(_screenSize.width, appBarHeight),
        child: AkAppBar(),
      ),
      drawer: AkDrawer(),
      body: child,

      // Scrollbar(
      //   radius: Radius.circular(20),
      //   child: NotificationListener<ScrollNotification>(
      //     onNotification: (scrollNotification) {
      //       WidgetsBinding.instance.addPostFrameCallback((_) =>
      //           _scrollData.updateScroll(
      //               scrollNotification.metrics, MediaQuery.of(context).size));
      //       return false;
      //     },
      //     child: Stack(
      //       alignment: Alignment.center,
      //       children: <Widget>[
      //         child,
      //       ],
      //     ),
      //   ),
      // ),

      // AkScrollbar(
      //   width: 10,
      //   backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
      //   color: Theme.of(context).primaryColor,
      //   child: child,
      // ),
    );
  }
}
