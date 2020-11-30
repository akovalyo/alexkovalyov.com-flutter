import 'package:flutter/material.dart';

import 'package:mysite/layout/image_placeholder.dart';
import 'package:mysite/view/posts_view.dart';
import 'package:mysite/layout/adaptive.dart';
import 'package:mysite/theme/consts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Container(
      child: SingleChildScrollView(
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
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        isSmallScreen(context) ? paddingSmall : paddingLarge),
                child: PostsGetter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
