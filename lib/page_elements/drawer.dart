import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:provider/provider.dart';

import '../helpers/navigation_helper.dart';
import '../navigation/routes.dart';
import '../widgets/hover_icon_button.dart';
import '../widgets/choice_chip.dart';
import '../models/app_state.dart';
import '../models/menu_items_list.dart';
import '../widgets/menu_item.dart';

class AkDrawer extends StatelessWidget {
  final AutoScrollController? controller;

  AkDrawer({this.controller});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final AppState appState = context.watch<AppState>();
    FocusScope.of(context).unfocus();
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColorDark,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: _screenHeight * 0.25,
              child: Stack(
                children: [
                  Container(
                    color: Color(0xFF202020),
                    alignment: Alignment.topRight,
                    child: IconButton(
                      color: Theme.of(context).secondaryHeaderColor,
                      icon: Icon(Icons.close_sharp),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      child: HoverIconButton(
                        onPressed: () {
                          final currRoot = currentRoot();
                          final route = Routes.homePageContains(currRoot);
                          if (route != null && controller != null) {
                            FocusScope.of(context).unfocus();
                            controller!.animateTo(
                              0,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                            );
                          } else {
                            navKey.currentState?.pushNamed(Routes.home.path);
                          }
                          Scaffold.of(context).openEndDrawer();
                        },
                        imageProvider: AssetImage('assets/images/main/akM.png'),
                        firstColor: Theme.of(context).secondaryHeaderColor,
                        secondColor: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: menuItemsList
                        .map((elem) {
                          if (elem['onlyAdmin'] == true &&
                              !appState.isLoggedIn) {
                            return null;
                          }

                          if (appState.isLoggedIn &&
                              elem['isLoggedin'] == 'hide') {
                            return null;
                          }

                          return MenuItem(
                            controller: controller == null ? null : controller,
                            title: elem['title'] as String,
                            path: elem['path'] as String,
                            fontSize: 18,
                          );
                        })
                        .where((e) => e != null)
                        .cast<Widget>()
                        .toList(),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 10),
              child: Text('Select Theme',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Theme.of(context).secondaryHeaderColor)),
            ),
            Container(
              alignment: Alignment.center,
              child: ThemeChoiceChip(),
            ),
          ],
        ),
      ),
    );
  }
}
