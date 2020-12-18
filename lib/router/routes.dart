import 'package:flutter/cupertino.dart';

import 'package:mysite/pages/home.dart';
import 'package:mysite/pages/example.dart';

const String routeHome = '/';
const String routeScroll = '/scroll';
const String routePosts = '/posts';

var routes = {
  routeHome: HomePage(),
  routeScroll: Example(),
};

final navKey = new GlobalKey<NavigatorState>();
