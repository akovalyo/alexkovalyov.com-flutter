import 'package:flutter/material.dart';

import 'package:mysite/widgets/ak_app_bar.dart';
import 'package:mysite/widgets/drawer.dart';
import 'package:mysite/widgets/scrollbar.dart';

class LayoutTemplate extends StatefulWidget {
  //LayoutTemplate({Key key}) : super(key: key);
  final Widget child;

  LayoutTemplate({@required this.child}) : assert(child != null);

  @override
  _LayoutTemplateState createState() => _LayoutTemplateState();
}

class _LayoutTemplateState extends State<LayoutTemplate> {
  ScrollController scrollController;
  double _scrollPos = 0;
  double opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPos = scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    opacity = _scrollPos > _screenSize.height * 0.5
        ? 1
        : _scrollPos / (_screenSize.height * 0.5);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(_screenSize.width, 70),
        child: AkAppBar(opacity),
      ),
      drawer: AkDrawer(),
      body: AkScrollbar(
        scrollController: scrollController,
        width: 10,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          controller: scrollController,
          child: widget.child,
        ),
      ),
    );
  }
}
