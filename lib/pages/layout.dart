import 'package:flutter/material.dart';

import 'package:mysite/widgets/ak_app_bar.dart';
import 'package:mysite/widgets/drawer.dart';

class LayoutTemplate extends StatefulWidget {
  LayoutTemplate({Key key}) : super(key: key);

  @override
  _LayoutTemplateState createState() => _LayoutTemplateState();
}

class _LayoutTemplateState extends State<LayoutTemplate> {
  ScrollController _scrollController;
  double _scrollPos = 0;
  double opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPos = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
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
      body: Center(
        child: Container(
            height: 400,
            child: Text(
              'Hello',
              style: Theme.of(context).textTheme.headline1,
            )),
      ),
    );
  }
}
