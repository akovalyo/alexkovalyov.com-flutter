import 'package:flutter/cupertino.dart';

import 'package:mysite/pages/home.dart';
import 'package:mysite/pages/example.dart';

const String routeHome = '/';
const String routeScroll = '/scroll';
const String routeBlog = '/blog';
const String routeProjects = '/projects';
const List homePage = [routeHome, routeBlog, routeProjects];

var routes = {
  routeHome: HomePage(null),
  routeScroll: Example(),
  routeBlog: HomePage('Blog')
};

final navKey = new GlobalKey<NavigatorState>();
