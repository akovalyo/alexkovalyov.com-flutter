import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

import 'package:mysite/consts/consts.dart';
import 'package:mysite/consts/routes.dart';
import 'package:mysite/page_elements/blog_items.dart';
import 'package:mysite/page_elements/header.dart';
import 'package:mysite/page_elements/footer.dart';
import 'package:mysite/page_elements/ak_app_bar.dart';
import 'package:mysite/page_elements/drawer.dart';
import 'package:mysite/page_elements/projects.dart';
import 'package:mysite/widgets/wrap_scroll_tag.dart';
import 'package:mysite/widgets/scroll_upward.dart';
import 'package:mysite/page_elements/contact.dart';

class HomePage extends StatefulWidget {
  final String? path;
  HomePage(this.path);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AutoScrollController _scrollController;

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
    if (widget.path != null) {
      setState(() {
        _scrollController.scrollToIndex(homeWidgets[widget.path],
            duration: Duration(milliseconds: 1000),
            preferPosition: AutoScrollPosition.begin);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

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
        index: homeWidgets[projects],
        child: Projects(),
      ),
      WrapScrollTag(
        controller: _scrollController,
        index: homeWidgets[blog],
        child: BlogItems(),
      ),
      SizedBox(
        height: _screenSize.height * 0.2,
      ),
      WrapScrollTag(
        controller: _scrollController,
        index: homeWidgets[contact],
        child: Contact(),
      ),
      const Footer(),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(_screenSize.width, appBarHeight),
        child: AkAppBar(
          controller: _scrollController,
          changeColor: true,
        ),
      ),
      drawer: AkDrawer(controller: _scrollController),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: <Widget>[
            VsScrollbar(
              controller: _scrollController,
              style: VsScrollbarStyle(
                color: Theme.of(context).accentColor.withOpacity(0.4),
                thickness: scrollBarThickness,
                radius: Radius.circular(scrollBarRadius),
              ),
              isAlwaysShown: false,
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(children: wList),
                controller: _scrollController,
              ),
            ),
            ScrollUpward(
              _scrollController,
              visiblePosition: 100,
            ),
          ],
        ),
      ),
    );
  }
}
