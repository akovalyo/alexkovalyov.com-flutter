import 'package:flutter/material.dart';

import 'package:mysite/layout/image_placeholder.dart';
import 'package:mysite/layout/adaptive.dart';
import 'package:mysite/theme/consts.dart';
import 'package:mysite/widgets/inherited_widget.dart';
import 'package:mysite/models/posts_model.dart';

class HomePage extends StatelessWidget {
  bool barOpacity() => false;

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    PostsModel postsModel = MainInheritedWidget.of(context).posts;

    return Container(
      child: SingleChildScrollView(
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
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        isSmallScreen(context) ? paddingSmall : paddingLarge),
                child: Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  children: postsModel.postCards(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
