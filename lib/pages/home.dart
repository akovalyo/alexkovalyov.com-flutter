import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:mysite/consts/consts.dart';
import 'package:mysite/consts/home_widgets_map.dart';
import 'package:mysite/page_elements/blog_items.dart';
import 'package:mysite/page_elements/header.dart';
import 'package:mysite/page_elements/footer.dart';
import 'package:mysite/widgets/wrap_scroll_tag.dart';
import 'package:mysite/widgets/scroll_upward.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AutoScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
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
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(children: wList),
          controller: _scrollController,
        ),
        ScrollUpward(
          _scrollController,
          visiblePosition: 100,
          paddingRight: paddingSmall,
        ),
      ],
    );
  }
}
