import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hovering/hovering.dart';

import 'package:mysite/helpers.dart';
import 'package:mysite/consts/routes.dart';
import 'package:mysite/consts/consts.dart';

import 'package:mysite/widgets/hover_icon_button.dart';
import 'package:mysite/widgets/menu_item.dart';
import 'package:mysite/widgets/overlay_menu.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class AkAppBar extends StatefulWidget {
  final AutoScrollController controller;
  final bool changeColor;

  AkAppBar(this.controller, {this.changeColor = false});

  @override
  _AkAppBarState createState() => _AkAppBarState();
}

class _AkAppBarState extends State<AkAppBar> {
  double _scrollPos = 0;
  bool _colorBlack = false;

  _scrollListener() {
    _scrollPos = widget.controller.position.pixels;
    if (_scrollPos > 100 && widget.changeColor && _colorBlack) {
      setState(() {
        _colorBlack = false;
      });
    } else if (_scrollPos < 100 && widget.changeColor && !_colorBlack) {
      setState(() {
        _colorBlack = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.changeColor) {
      _colorBlack = true;
    }
    widget.controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    //print('AppBar');
    final _leadingMenuButton = IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );

    final List<Widget> _menuItems = menuItems.map((elem) {
      return MenuItem(
        controller: widget.controller,
        title: elem['title'],
        path: elem['path'],
        fontSize: 16,
        column: false,
      );
    }).toList();

    final _mainIcon = Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      child: HoverIconButton(
        onPressed: () {
          final _currRoot = currentRoot();
          if (homePage.contains(_currRoot)) {
            widget.controller.animateTo(
              0,
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            );
          } else {
            navKey.currentState.pushNamed(routeHome);
          }
        },
        imageProvider: AssetImage('assets/images/main/akM.png'),
        firstColor: Theme.of(context).secondaryHeaderColor,
        secondColor: Theme.of(context).accentColor,
      ),
    );

    return isSmallScreen(context)
        ? AppBar(
            backgroundColor:
                _colorBlack ? Colors.black : Theme.of(context).primaryColor,
            centerTitle: true,
            elevation: 0,
            toolbarHeight: appBarHeight,
            leading: _leadingMenuButton,
            title: _mainIcon,
            actions: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: OverlayMenu(
                  borderRadius: BorderRadius.circular(0),
                  backgroundColor: _colorBlack
                      ? Color(0x00000000)
                      : Theme.of(context).primaryColor,
                  links: menuItems.map((elem) {
                    return Center(
                      child: HoverCrossFadeWidget(
                        cursor: SystemMouseCursors.click,
                        firstChild: Text(
                          elem['title'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        secondChild: Text(
                          elem['title'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        duration: Duration(milliseconds: 200),
                      ),
                    );
                  }).toList(),
                  onChange: (index) {
                    final _currRoot = currentRoot();
                    if (homePage.contains(_currRoot)) {
                      widget.controller.scrollToIndex(
                        index,
                        duration: Duration(milliseconds: 1000),
                        preferPosition: AutoScrollPosition.begin,
                      );
                    } else {
                      navKey.currentState.pushNamed(menuItems[index]['path']);
                    }
                  },
                ),
              ),
            ],
          )
        : AppBar(
            backgroundColor:
                _colorBlack ? Colors.black : Theme.of(context).primaryColor,
            centerTitle: true,
            elevation: 0,
            toolbarHeight: appBarHeight,
            leading: _leadingMenuButton,
            title: _mainIcon,
            actions: _menuItems,
          );
  }
}
