import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:mysite/consts/consts.dart';
import 'package:mysite/consts/routes.dart';
import 'package:mysite/widgets/image_placeholder.dart';
import 'package:mysite/widgets/button.dart';

class Header extends StatelessWidget {
  final AutoScrollController controller;
  Header(this.controller);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
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
                  AkButton(
                    child: Text(
                      'Projects',
                      style: TextStyle(fontSize: 20),
                    ),
                    backgroundColor: Color(0x00000000),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    color: Theme.of(context).secondaryHeaderColor,
                    hoverColor: Theme.of(context).accentColor,
                    onPressed: () {
                      controller.scrollToIndex(
                        homeWidgets[projects],
                        preferPosition: AutoScrollPosition.begin,
                        duration: Duration(milliseconds: 1000),
                      );
                    },
                  ),
                  AkButton(
                    child: Text(
                      'Blog',
                      style: TextStyle(fontSize: 20),
                    ),
                    backgroundColor: Color(0x00000000),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    color: Theme.of(context).secondaryHeaderColor,
                    hoverColor: Theme.of(context).accentColor,
                    onPressed: () {
                      controller.scrollToIndex(
                        homeWidgets[blog],
                        preferPosition: AutoScrollPosition.begin,
                        duration: Duration(milliseconds: 1000),
                      );
                    },
                  ),
                  AkButton(
                    child: Text(
                      'Contact',
                      style: TextStyle(fontSize: 20),
                    ),
                    backgroundColor: Color(0x00000000),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    color: Theme.of(context).secondaryHeaderColor,
                    hoverColor: Theme.of(context).accentColor,
                    onPressed: () {
                      controller.scrollToIndex(
                        homeWidgets[contact],
                        preferPosition: AutoScrollPosition.begin,
                        duration: Duration(milliseconds: 1000),
                      );
                    },
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
