import 'package:flutter/cupertino.dart';

import 'package:mysite/pages/home.dart';
import 'package:mysite/pages/home2.dart';
import 'package:mysite/pages/scroll.dart';

const String routeHome = '/';
const String routeScroll = '/scroll';
const String routeHome2 = '/home2';
const String routePosts = '/posts';

var routes = {
  routeHome: HomePage(),
  routeScroll: Example(),
  routeHome2: HomePage2(),
};

final navKey = new GlobalKey<NavigatorState>();
