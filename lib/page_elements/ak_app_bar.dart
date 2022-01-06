import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hovering/hovering.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../helpers.dart';
import '../navigation/routes.dart';
import '../widgets/hover_icon_button.dart';
import '../models/menu_items_list.dart';
import '../widgets/menu_item.dart';
import '../widgets/overlay_menu.dart';
import '../consts/consts.dart';

class AkAppBar extends StatefulWidget {
  final AutoScrollController? controller;
  final bool changeColor;

  AkAppBar({this.controller, this.changeColor = false});

  @override
  _AkAppBarState createState() => _AkAppBarState();
}

class _AkAppBarState extends State<AkAppBar> {
  double _scrollPos = 0;
  bool _colorBlack = false;

  _scrollListener() {
    _scrollPos = widget.controller!.position.pixels;
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
    if (widget.controller != null) {
      widget.controller?.addListener(_scrollListener);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.controller != null) {
      widget.controller?.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _leadingMenuButton = IconButton(
      color: Theme.of(context).secondaryHeaderColor,
      icon: const Icon(Icons.menu),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );

    final List<Widget> _menuItems = menuItemsList.map((elem) {
      return MenuItem(
        controller: widget.controller == null ? null : widget.controller,
        title: elem['title'] as String,
        path: elem['path'] as String,
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
          final route = Routes.homePageContains(_currRoot);
          if (route != null) {
            FocusScope.of(context).unfocus();
            widget.controller?.animateTo(
              0,
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            );
          } else {
            navKey.currentState?.pushNamed(Routes.home.path);
          }
        },
        imageProvider: AssetImage('assets/images/main/akM.png'),
        firstColor: Theme.of(context).secondaryHeaderColor,
        secondColor: Theme.of(context).colorScheme.secondary,
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
                  links: menuItemsList.map((elem) {
                    return Center(
                      child: HoverCrossFadeWidget(
                        cursor: SystemMouseCursors.click,
                        firstChild: Text(
                          elem['title'] as String,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        secondChild: Text(
                          elem['title'] as String,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        duration: Duration(milliseconds: 200),
                      ),
                    );
                  }).toList(),
                  onChange: (index) {
                    final _currRoot = currentRoot();
                    final route = Routes.homePageContains(_currRoot);
                    if (route != null) {
                      widget.controller?.scrollToIndex(
                        index,
                        duration: Duration(milliseconds: 1000),
                        preferPosition: AutoScrollPosition.begin,
                      );
                    } else {
                      navKey.currentState
                          ?.pushNamed(menuItemsList[index]['path']!);
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
