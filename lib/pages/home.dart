import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

import '../consts/consts.dart';
import '../navigation/routes.dart';
import '../page_elements/blog_post_cards.dart';
import '../page_elements/header.dart';
import '../page_elements/footer.dart';
import '../page_elements/ak_app_bar.dart';
import '../page_elements/drawer.dart';
import '../page_elements/projects.dart';
import '../widgets/wrap_scroll_tag.dart';
import '../widgets/scroll_upward.dart';
import '../page_elements/contact.dart';

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
        Rt? route = Routes.homePageContains(widget.path);
        _scrollController.scrollToIndex(route?.homeWidgetNum as int,
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
        index: Routes.home.homeWidgetNum as int,
        child: Header(_scrollController),
      ),
      const SizedBox(
        height: 40,
      ),
      WrapScrollTag(
        controller: _scrollController,
        index: Routes.projects.homeWidgetNum as int,
        child: Projects(),
      ),
      WrapScrollTag(
        controller: _scrollController,
        index: Routes.blog.homeWidgetNum as int,
        child: BlogPostCards(),
      ),
      SizedBox(
        height: _screenSize.height * 0.2,
      ),
      WrapScrollTag(
        controller: _scrollController,
        index: Routes.contact.homeWidgetNum as int,
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
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
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
