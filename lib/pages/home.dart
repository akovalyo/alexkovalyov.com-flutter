import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:mysite/consts/consts.dart';
import 'package:mysite/consts/home_widgets_map.dart';
import 'package:mysite/widgets/wrap_scroll_tag.dart';
import 'package:mysite/widgets/scroll_upward.dart';
import 'package:mysite/page_elements/blog_items.dart';
import 'package:mysite/page_elements/header.dart';
import 'package:mysite/page_elements/footer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AutoScrollController _scrollController;
  double _scrollPos = 0;
  double _upwardArrowPadding = 0;
  // double _opacity = 0;

  _scrollListener() {
    setState(() {
      var _low = _scrollController.position.maxScrollExtent;
      _scrollPos = _scrollController.position.pixels;
      if (_scrollPos > (_low * 0.9)) {
        _upwardArrowPadding = 120 * (1 - ((_low - _scrollPos) / (_low * 0.1)));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    //var _scrollData = Provider.of<Scroll>(context, listen: false);
    _scrollController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
    _scrollController.addListener(_scrollListener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context).settings.arguments;
    if (args != null) {
      setState(() {
        _scrollController.scrollToIndex(homeWidgets[args],
            duration: Duration(milliseconds: 1));
      });
    }
  }

  void scrollToIndex(ind) {
    setState(() {
      _scrollController.scrollToIndex(ind);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> wList = [
      WrapScrollTag(
        controller: _scrollController,
        index: homeWidgets[home],
        child: Header(_scrollController),
      ),
      const SizedBox(
        height: 40,
      ),
      WrapScrollTag(
        controller: _scrollController,
        index: homeWidgets[blog],
        child: BlogItems(),
      ),
      WrapScrollTag(
        controller: _scrollController,
        index: homeWidgets[projects],
        child: Container(height: 600, child: Text('Projects')),
      ),
      WrapScrollTag(
        controller: _scrollController,
        index: 3,
        child: Container(height: 600, child: Text('Hello2')),
      ),
      const Footer(),
    ];

    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: wList),
          controller: _scrollController,
        ),
        Container(
          child: ScrollUpward(
            _scrollController,
            alwaysShow: false,
          ),
          padding:
              EdgeInsets.only(bottom: _upwardArrowPadding, right: paddingSmall),
          alignment: Alignment.bottomRight,
        ),
      ],
    );
  }
}
