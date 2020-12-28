import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:mysite/consts/consts.dart';
import 'package:mysite/consts/home_widgets_map.dart';
import 'package:mysite/helper/screen_size.dart';
import 'package:mysite/widgets/image_placeholder.dart';

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
                    homeWidgets[projects],
                    preferPosition: AutoScrollPosition.begin,
                    duration: Duration(milliseconds: 1000),
                  );
                },
                child: Text('Projects'),
              ),
              FlatButton(
                onPressed: () {
                  print(homeWidgets[blog]);
                  controller.scrollToIndex(
                    homeWidgets[blog],
                    preferPosition: AutoScrollPosition.begin,
                    duration: Duration(milliseconds: 1000),
                  );
                },
                child: Text('Blog'),
              ),
              FlatButton(
                onPressed: () {
                  controller.scrollToIndex(
                    2,
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
