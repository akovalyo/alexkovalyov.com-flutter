import 'package:flutter/material.dart';

import 'package:mysite/widgets/ak_app_bar.dart';
import 'package:mysite/widgets/drawer.dart';
import 'package:mysite/widgets/scrollbar.dart';
import 'package:mysite/layout/screen_size.dart';
import 'package:mysite/theme/consts.dart';

class LayoutTemplate extends StatefulWidget {
  //LayoutTemplate({Key key}) : super(key: key);
  final Widget child;

  LayoutTemplate({@required this.child}) : assert(child != null);

  @override
  _LayoutTemplateState createState() => _LayoutTemplateState();
}

class _LayoutTemplateState extends State<LayoutTemplate> {
  double _scrollPos = 0;
  double opacity = 0;

  _updateScroll(ScrollMetrics metrics) {
    setState(() {
      _scrollPos = metrics.pixels;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = screenSize(context);
    opacity = _scrollPos > _screenSize.height * 0.5
        ? 1
        : _scrollPos / (_screenSize.height * 0.5);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(_screenSize.width, appBarHeight),
        child: AkAppBar(opacity),
      ),
      drawer: AkDrawer(),
      body: Scrollbar(
        radius: Radius.circular(20),
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            _updateScroll(scrollNotification.metrics);
            return false;
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              widget.child,
              // SingleChildScrollView(
              //   physics: ClampingScrollPhysics(),
              //   controller: controller,
              //   child: widget.child,
              // ),
            ],
          ),
        ),
      ),

      // body: Stack(
      //   alignment: Alignment.center,
      //   children: <Widget>[
      //     SingleChildScrollView(
      //       physics: ClampingScrollPhysics(),
      //       controller: controller,
      //       child: widget.child,
      //     ),
      //     AkScrollbar(
      //       scrollController: controller,
      //       width: 10,
      //       backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
      //       color: Theme.of(context).primaryColor,
      //     ),
      //   ],
      // ),
    );
  }
}
