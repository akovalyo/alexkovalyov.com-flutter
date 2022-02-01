import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

import '../models/post.dart';
import '../page_elements/ak_app_bar.dart';
import '../page_elements/drawer.dart';
import '../page_elements/footer.dart';
import '../consts/consts.dart';
import '../widgets/image_placeholder.dart';
import '../helpers/screen_helper.dart';
import '../widgets/scroll_upward.dart';
import '../widgets/ak_circular_progress_indicator.dart';

class PostPage extends StatefulWidget {
  final Post post;
  PostPage(this.post);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late final AutoScrollController controller;
  bool isLoading = true;
  List<Widget> decodedBody = <Widget>[];
  late DocumentSnapshot snapshot;

  void loadPostBody() async {
    final CollectionReference bodyRef = FirebaseFirestore.instance
        .collection('posts/${widget.post.postId}/body');
    final DocumentSnapshot loadBody = await bodyRef.doc('0').get();
    setState(() {
      snapshot = loadBody;
    });
  }

  void decodePostBody(BuildContext context, AutoScrollController controller) {
    try {
      decodedBody = widget.post.decodeBody(context, controller, snapshot);
    } catch (err) {}
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    controller = AutoScrollController(
        debugLabel: 'PostPage Controller',
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
    loadPostBody();
  }

  @override
  void dispose() {
    super.dispose();
    // print('Dispose: ${controller.debugLabel}');
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
          ? Center(child: AkCircularProgressIndicator())
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
                            child: ImagePlaceholder(
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
                                right: ScreenHelper.isSmallScreen(context)
                                    ? paddingSmall
                                    : paddingLarge,
                                left: ScreenHelper.isSmallScreen(context)
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
                                left: ScreenHelper.isSmallScreen(context)
                                    ? paddingSmall
                                    : paddingLarge,
                                right: ScreenHelper.isSmallScreen(context)
                                    ? paddingSmall
                                    : paddingLarge,
                              ),
                              child: Text(
                                post.date,
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenHelper.isSmallScreen(context)
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
