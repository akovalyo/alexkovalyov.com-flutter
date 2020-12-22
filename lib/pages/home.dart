import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mysite/layout/image_placeholder.dart';
import 'package:mysite/layout/screen_size.dart';
import 'package:mysite/consts/consts.dart';
import 'package:mysite/models/posts_model.dart';
import 'package:mysite/widgets/footer.dart';
import 'package:mysite/models/scroll.dart';
import 'package:mysite/widgets/social_tab.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _postsData = Provider.of<PostsModel>(context, listen: false);
    final _posts = _postsData.getPosts(context);
    final _screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
          Container(
            width: _screenSize.width,
            height: _screenSize.height * 0.4,
            child: FadeInImageAny(
              imagePath: 'assets/images/main/main.jpg',
              placeholder: SizedBox(
                width: _screenSize.width,
                height: _screenSize.height * 0.4,
              ),
              width: _screenSize.width,
              height: _screenSize.height * 0.4,
              fit: BoxFit.cover,
            ),
          ),
          Hello(),
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal:
                    isSmallScreen(context) ? paddingSmall : paddingLarge),
            child: Wrap(
              spacing: 40,
              runSpacing: 40,
              children: _posts,
            ),
          ),
          Container(
            child: Footer(),
          )
        ],
      ),
    );
  }
}

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _screenSize = screenSize(context);
    var _scrollData = Provider.of<Scroll>(context, listen: true);
    return Container(
      // foregroundDecoration: BoxDecoration(
      //   color: Theme.of(context).primaryColor,
      // ),
      width: _screenSize.width,
      height: 200, //_screenSize.height * 0.6,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Column(children: <Widget>[
        Text(
          'Hello',
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
        SocialTab(),
      ]),
    );
  }
}
