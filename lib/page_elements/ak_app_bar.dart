import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:provider/provider.dart';

import '../models/app_state.dart';
import '../navigation/navigation_helper.dart';
import '../navigation/routes.dart';
import '../widgets/hover_icon_button.dart';
import '../widgets/circle_image.dart';
import '../consts/consts.dart';

import '../widgets/hover_link.dart';

class AkAppBar extends StatefulWidget {
  final AutoScrollController? controller;
  final bool changeColor;

  AkAppBar({this.controller, this.changeColor = false});

  @override
  _AkAppBarState createState() => _AkAppBarState();
}

class _AkAppBarState extends State<AkAppBar> {
  double scrollPos = 0;
  bool colorBlack = false;

  _scrollListener() {
    scrollPos = widget.controller!.position.pixels;
    if (scrollPos > 100 && widget.changeColor && colorBlack) {
      setState(() {
        colorBlack = false;
      });
    } else if (scrollPos < 100 && widget.changeColor && !colorBlack) {
      setState(() {
        colorBlack = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.changeColor) {
      colorBlack = true;
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
    final appState = Provider.of<AppState>(context);
    final leadingMenuButton = IconButton(
      color: Theme.of(context).secondaryHeaderColor,
      icon: const Icon(Icons.menu),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );

    final mainIcon = Container(
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

    List<HoverLink> menuLinks = [
      HoverLink(
        title: 'Messages',
        onPressed: () {
          navKey.currentState?.pushNamed(Routes.messages.path);
        },
      ),
      HoverLink(
        title: 'Logout',
        onPressed: () {
          appState.logout();
          navKey.currentState?.pushNamed(Routes.home.path);
        },
      ),
    ];

    return AppBar(
      backgroundColor:
          colorBlack ? Colors.black : Theme.of(context).primaryColor,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: appBarHeight,
      leading: leadingMenuButton,
      title: mainIcon,
      actions: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: appState.isLoggedIn
                ? PopupMenuButton(
                    iconSize: 40,
                    icon: CircleImage(
                      // imageRadius: 40,
                      imageProvider:
                          AssetImage('assets/images/profile_image.png'),
                    ),
                    tooltip: '',
                    elevation: 5,
                    enableFeedback: false,
                    color: colorBlack
                        ? Colors.black
                        : Theme.of(context).primaryColor,
                    itemBuilder: (_) {
                      return menuLinks.map((link) {
                        return PopupMenuItem(child: link);
                      }).toList();
                    })
                : HoverLink(
                    title: 'Login',
                    fontSize: 16.0,
                    onPressed: () {
                      navKey.currentState?.pushNamed(Routes.login.path);
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
