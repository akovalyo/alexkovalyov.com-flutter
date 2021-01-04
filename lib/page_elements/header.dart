import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:mysite/consts/consts.dart';
import 'package:mysite/consts/routes.dart';
import 'package:mysite/helpers.dart';
import 'package:mysite/widgets/image_placeholder.dart';
import 'package:mysite/widgets/header_button.dart';

class Header extends StatelessWidget {
  final AutoScrollController controller;
  Header(this.controller);

  @override
  Widget build(BuildContext context) {
    final _screenSize = screenSize(context);
    final _heightBottom = _screenSize.height * 0.6 - appBarHeight;
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
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
            alignment: Alignment.center,
            width: _screenSize.width,
            height: _heightBottom < 100 ? 100 : _heightBottom,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Hello, I'm  Alex Kovalyov.\nI'm a software developer.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 28,
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                  ),
                  HeaderButton(
                    controller: controller,
                    scrollToIndex: homeWidgets[projects],
                    title: 'Projects',
                  ),
                  HeaderButton(
                    controller: controller,
                    scrollToIndex: homeWidgets[blog],
                    title: 'Blog',
                  ),
                  HeaderButton(
                    controller: controller,
                    scrollToIndex: homeWidgets[contact],
                    title: 'Contact',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
