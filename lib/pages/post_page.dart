import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

import '../models/post.dart';
import '../page_elements/ak_app_bar.dart';
import '../page_elements/drawer.dart';
import '../page_elements/footer.dart';
import '../consts/consts.dart';
import '../widgets/image_placeholder.dart';
import '../helpers.dart';
import '../widgets/scroll_upward.dart';

class PostPage extends StatefulWidget {
  final Post post;
  PostPage(this.post);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late AutoScrollController controller;
  bool isLoading = true;
  List<Widget> decodedBody = <Widget>[];

  void decodePostBody(
      BuildContext context, AutoScrollController controller) async {
    try {
      decodedBody = await widget.post.decodeBody(context, controller);
    } catch (err) {}
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Post post = widget.post;
    final screenSize = MediaQuery.of(context).size;
    decodePostBody(context, controller);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, appBarHeight),
        child: AkAppBar(controller: controller),
      ),
      drawer: AkDrawer(controller: controller),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: <Widget>[
                VsScrollbar(
                  controller: controller,
                  style: VsScrollbarStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.4),
                    radius: Radius.circular(scrollBarRadius),
                    thickness: scrollBarThickness,
                  ),
                  isAlwaysShown: false,
                  child: SingleChildScrollView(
                    controller: controller,
                    physics: ClampingScrollPhysics(),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            width: screenSize.width,
                            height: screenSize.height * 0.4,
                            child: FadeInImageAny(
                              imagePath: post.imageUrl,
                              placeholder: SizedBox(
                                width: screenSize.width,
                                height: screenSize.height * 0.4,
                              ),
                              width: screenSize.width,
                              height: screenSize.height * 0.4,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(
                                top: 20,
                                bottom: 10,
                                right: isSmallScreen(context)
                                    ? paddingSmall
                                    : paddingLarge,
                                left: isSmallScreen(context)
                                    ? paddingSmall
                                    : paddingLarge,
                              ),
                              child: Text(
                                post.title,
                                style: Theme.of(context).textTheme.headline4,
                              )),
                          Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(
                                bottom: 20,
                                left: isSmallScreen(context)
                                    ? paddingSmall
                                    : paddingLarge,
                                right: isSmallScreen(context)
                                    ? paddingSmall
                                    : paddingLarge,
                              ),
                              child: Text(
                                post.date,
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: isSmallScreen(context)
                                    ? paddingSmall
                                    : paddingLarge),
                            child: Column(
                              children: decodedBody,
                            ),
                          ),
                          Container(
                            child: const Footer(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ScrollUpward(
                  controller,
                  visiblePosition: 100,
                ),
              ],
            ),
    );
  }
}
