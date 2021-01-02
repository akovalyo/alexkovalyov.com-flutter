import 'package:flutter/cupertino.dart';

import 'package:mysite/pages/home.dart';
import 'package:mysite/pages/example.dart';
import 'package:mysite/pages/project_minishell.dart';

const routeHome = '/';
const routeScroll = '/scroll';
const routeBlog = 'blog';
const routeProjects = 'projects';
const routeProjectMinishell = 'projects_minishell';

const homePage = [routeHome, routeBlog, routeProjects];

const home = 'Home';
const projects = 'Projects';
const blog = 'Blog';

const Map homeWidgets = {
  home: 0,
  projects: 1,
  blog: 2,
};

const menuItems = [
  {
    'title': home,
    'path': routeHome,
  },
  {
    'title': projects,
    'path': routeProjects,
  },
  {
    'title': blog,
    'path': routeBlog,
  },
];

var routes = {
  routeHome: HomePage(null),
  routeScroll: Example(),
  routeBlog: HomePage('Blog'),
  routeProjects: HomePage('Projects'),
  //routeProjectMinishell: PageBuilder(),
};

final navKey = new GlobalKey<NavigatorState>();
