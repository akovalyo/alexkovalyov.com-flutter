import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:provider/provider.dart';

import '../navigation/routes.dart';
import '../helpers/navigation_helper.dart';
import '../models/app_state.dart';
import 'ak_circular_progress_indicator.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String path;
  final AutoScrollController? controller;
  final double fontSize;
  final bool inAppbar;

  const MenuItem({
    required this.title,
    required this.path,
    this.controller,
    required this.fontSize,
    this.inAppbar = false,
  });

  @override
  Widget build(BuildContext context) {
    final AppState appState = context.watch<AppState>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: HoverButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Text(title,
                style: TextStyle(
                  fontSize: fontSize,
                )),
            textColor: Theme.of(context).secondaryHeaderColor,
            hoverTextColor: Theme.of(context).colorScheme.secondary,
            hoverElevation: 0,
            focusElevation: 0,
            hoverColor: Color(0x00000000),
            highlightColor: Color(0x00000000),
            splashColor: Color(0x00000000),
            onpressed: () async {
              final currRoot = currentRoot();

              if (path == 'logout') {
                await appState.logout();
                navKey.currentState?.pushNamed(Routes.home.path);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Signed out'),
                    backgroundColor: Colors.green[600]!.withOpacity(0.7),
                  ),
                );
              } else if (!inAppbar &&
                  Routes.homePageContains(currRoot) != null &&
                  Routes.homePageContains(path) != null) {
                Rt? route = Routes.homePageContains(path);
                FocusScope.of(context).unfocus();
                controller?.scrollToIndex(
                  route!.homeWidgetNum as int,
                  duration: Duration(milliseconds: 1000),
                  preferPosition: AutoScrollPosition.begin,
                );
              } else {
                navKey.currentState?.pushNamed(path);
              }
              if (!inAppbar) Scaffold.of(context).openEndDrawer();
            },
          ),
        ),
        path == 'logout' && appState.isLoading
            ? AkCircularProgressIndicator()
            : Container(),
      ],
    );
  }
}
