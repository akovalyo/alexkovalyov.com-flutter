import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mysite/layout/image_placeholder.dart';
import 'package:mysite/layout/screen_size.dart';
import 'package:mysite/consts/consts.dart';
import 'package:mysite/models/posts_model.dart';
import 'package:mysite/widgets/footer.dart';
import 'package:mysite/models/scroll.dart';
import 'package:mysite/widgets/social_tab.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:mysite/widgets/wrap_scroll_tag.dart';

enum homeWidgets {
  projects,
  blog,
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AutoScrollController _scrollController;
  double _scrollPos = 0;
  // double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPos = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    //var _screenSize = MediaQuery.of(context).size;
    final List<Widget> wList = [
      Header(_scrollController),

      const SizedBox(
        height: 40,
      ),
      WrapScrollTag(
        controller: _scrollController,
        index: homeWidgets.blog.index,
        child: Posts(),
      ),
      // Posts(),
      WrapScrollTag(
        controller: _scrollController,
        index: 2,
        child: Container(height: 600, child: Text('Hello2')),
      ),
      WrapScrollTag(
        controller: _scrollController,
        index: 3,
        child: Container(height: 600, child: Text('Hello3')),
      ),
      const Footer(),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: wList),
      // itemCount: wList.length,
      // itemBuilder: (BuildContext context, int index) {
      //   return wList[index];
      // },
      controller: _scrollController,
    );
  }
}

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _postsData = Provider.of<PostsModel>(context, listen: false);
    final _posts = _postsData.getPosts(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen(context) ? paddingSmall : paddingLarge),
      child: Center(
        child: Wrap(
          spacing: 40,
          runSpacing: 40,
          children: _posts,
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final AutoScrollController controller;
  Header(this.controller);

  @override
  Widget build(BuildContext context) {
    var _screenSize = screenSize(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          //color: Colors.black,
          width: _screenSize.width,
          height: _screenSize.height * 0.4,
          child: FadeInImageAny(
            imagePath: 'assets/images/main/main.jpg',
            placeholder: Container(
              color: Colors.black,
              width: _screenSize.width,
              height: _screenSize.height * 0.4,
            ),
            width: _screenSize.width,
            height: _screenSize.height * 0.4,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          // foregroundDecoration: BoxDecoration(
          //   color: Theme.of(context).primaryColor,
          // ),
          width: _screenSize.width,
          height: _screenSize.height * 0.6 - appBarHeight,
          color: Theme.of(context).backgroundColor,
          padding: EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hello, I'm  Alex Kovalyov.\nI'm a software developer.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              FlatButton(
                onPressed: () {
                  controller.scrollToIndex(
                    2,
                    preferPosition: AutoScrollPosition.begin,
                    duration: Duration(milliseconds: 1000),
                  );
                },
                child: Text('Projects'),
              ),
              FlatButton(
                onPressed: () {
                  controller.scrollToIndex(
                    homeWidgets.blog.index,
                    preferPosition: AutoScrollPosition.begin,
                    duration: Duration(milliseconds: 1000),
                  );
                },
                child: Text('Blog'),
              ),
              FlatButton(
                onPressed: () {
                  controller.scrollToIndex(
                    3,
                    preferPosition: AutoScrollPosition.begin,
                    duration: Duration(milliseconds: 1000),
                  );
                },
                child: Text('4'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final _postsData = Provider.of<PostsModel>(context, listen: false);
//     final _posts = _postsData.getPosts(context);
//     final _screenSize = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       physics: ClampingScrollPhysics(),
//       child: Column(
//         children: [
//           Container(
//             width: _screenSize.width,
//             height: _screenSize.height * 0.4,
//             child: FadeInImageAny(
//               imagePath: 'assets/images/main/main.jpg',
//               placeholder: SizedBox(
//                 width: _screenSize.width,
//                 height: _screenSize.height * 0.4,
//               ),
//               width: _screenSize.width,
//               height: _screenSize.height * 0.4,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Hello(),
//           const SizedBox(
//             height: 40,
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(
//                 horizontal:
//                     isSmallScreen(context) ? paddingSmall : paddingLarge),
//             child: Wrap(
//               spacing: 40,
//               runSpacing: 40,
//               children: _posts,
//             ),
//           ),
//           Container(
//             child: Footer(),
//           )
//         ],
//       ),
//     );
//   }
// }

// class Hello extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var _screenSize = screenSize(context);
//     //var _scrollData = Provider.of<Scroll>(context, listen: true);
//     return Container(
//       // foregroundDecoration: BoxDecoration(
//       //   color: Theme.of(context).primaryColor,
//       // ),
//       width: _screenSize.width,
//       height: 200, //_screenSize.height * 0.6,
//       color: Theme.of(context).primaryColor,
//       padding: EdgeInsets.symmetric(
//         vertical: 20,
//       ),
//       child: Column(children: <Widget>[
//         Text(
//           'Hello',
//           style: TextStyle(fontSize: 28, color: Colors.white),
//         ),
//         SocialTab(),
//       ]),
//     );
//   }
// }
