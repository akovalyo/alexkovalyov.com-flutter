import 'package:flutter/cupertino.dart';

import 'package:mysite/pages/home.dart';
import 'package:mysite/pages/login_page.dart';
import 'package:mysite/pages/template_basic.dart';
import 'package:mysite/pages/messages_page.dart';
import 'package:mysite/pages/project_minishell.dart';

const routeHome = '/';
const routeBlog = 'blog';
const routeProjects = 'projects';
const routeContact = 'contact';
const routeLogin = 'login';
const routeMessages = 'messages';
const routeProjectMinishell = 'minishell';

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

var routes = {
  routeHome: HomePage(null),
  routeBlog: HomePage(blog),
  routeProjects: HomePage(projects),
  routeContact: HomePage(contact),
  routeLogin: TemplateBasic(LoginPage()),
  routeMessages: TemplateBasic(MessagesPage()),
  routeProjectMinishell: TemplateBasic(ProjectMinishell()),
};

final navKey = new GlobalKey<NavigatorState>();
