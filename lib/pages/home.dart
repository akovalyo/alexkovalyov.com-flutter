import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mysite/layout/image_placeholder.dart';
import 'package:mysite/layout/screen_size.dart';
import 'package:mysite/theme/consts.dart';
import 'package:mysite/models/posts_model.dart';
import 'package:mysite/widgets/footer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _postsData = Provider.of<PostsModel>(context, listen: false);
    final _posts = _postsData.getPosts(context);
    final _screenSize = MediaQuery.of(context).size;
    print("Home");
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: _screenSize.width,
              height: _screenSize.height * 0.4,
              child: FadeInImageAny(
                image: AssetImage('assets/images/site/main.jpg'),
                placeholder: SizedBox(
                  width: _screenSize.width,
                  height: _screenSize.height * 0.4,
                ),
                width: _screenSize.width,
                height: _screenSize.height * 0.4,
                fit: BoxFit.cover,
              ),
            ),
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
      ),
    );
  }
}
