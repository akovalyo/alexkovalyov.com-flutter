import 'package:flutter/cupertino.dart';

import 'package:mysite/pages/home.dart';
import 'package:mysite/pages/example.dart';
import 'package:mysite/pages/login_page.dart';
import 'package:mysite/pages/template_basic.dart';

const routeHome = '/';
const routeScroll = '/scroll';
const routeBlog = 'blog';
const routeProjects = 'projects';
const routeContact = 'contact';
const routeLogin = 'login';
const routeProjectMinishell = 'projects_minishell';

const homePage = [
  routeHome,
  routeBlog,
  routeProjects,
  routeContact,
];

const home = 'Home';
const projects = 'Projects';
const blog = 'Blog';
const contact = 'Contact';

const Map homeWidgets = {
  home: 0,
  projects: 1,
  blog: 2,
  contact: 3,
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
  {
    'title': contact,
    'path': routeContact,
  },
];

// const titles = {
//   routeProjects: projects,
//   routeBlog: blog,
//   routeProjectMinishell: 'Project Minishell',
// };

var routes = {
  routeHome: HomePage(null),
  routeScroll: Example(),
  routeBlog: HomePage(blog),
  routeProjects: HomePage(projects),
  routeContact: HomePage(contact),
  routeLogin: TemplateBasic(LoginPage()),
  //routeProjectMinishell: PageBuilder(),
};

final navKey = new GlobalKey<NavigatorState>();
