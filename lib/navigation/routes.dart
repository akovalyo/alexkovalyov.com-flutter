import 'package:flutter/material.dart';

import '../pages/pages.dart';

class Rt {
  final String path;
  final bool homePage;
  final int? homeWidgetNum;
  final String title;
  final Function widget;

  Rt({
    required this.path,
    required this.homePage,
    required this.homeWidgetNum,
    required this.title,
    required this.widget,
  });
}

class Routes {
  static final home = Rt(
    path: '/',
    homePage: true,
    homeWidgetNum: 0,
    title: 'Home',
    widget: () => HomePage(null),
  );

  static final projects = Rt(
    path: '/projects',
    homePage: true,
    homeWidgetNum: 1,
    title: 'Projects',
    widget: () => HomePage('/projects'),
  );

  static final blog = Rt(
    path: '/blog',
    homePage: true,
    homeWidgetNum: 2,
    title: 'Blog',
    widget: () => HomePage('/blog'),
  );

  static final contact = Rt(
      path: '/contact',
      homePage: true,
      homeWidgetNum: 3,
      title: 'Contact',
      widget: () => HomePage('/contact'));

  static final login = Rt(
    path: '/login',
    homePage: false,
    homeWidgetNum: null,
    title: 'Login',
    widget: () => BasicPageTemplate(LoginPage()),
  );

  static final messages = Rt(
    path: '/messages',
    homePage: false,
    homeWidgetNum: null,
    title: 'Messages',
    widget: () => BasicPageTemplate(MessagesPage()),
  );

  static final minishell = Rt(
    path: '/minishell',
    homePage: false,
    homeWidgetNum: null,
    title: 'Minishell',
    widget: () => BasicPageTemplate(ProjectMinishell()),
  );

  static final nft = Rt(
    path: '/nft-gallery',
    homePage: false,
    homeWidgetNum: null,
    title: 'Nft Gallery',
    widget: () => NftGalleryPage(),
  );

  static final List<Rt> all = [
    Routes.home,
    Routes.blog,
    Routes.projects,
    Routes.contact,
    Routes.login,
    Routes.messages,
    Routes.minishell,
    Routes.nft,
  ];

  static Rt? contains(String? path) {
    var contain = Routes.all.where((r) => r.path == path);
    if (contain.isNotEmpty) return contain.first;
    return null;
  }

  static Rt? homePageContains(String? path) {
    var contain = Routes.all.where((r) => r.path == path && r.homePage == true);
    if (contain.isNotEmpty) return contain.first;
    return null;
  }
}

final navKey = new GlobalKey<NavigatorState>();
