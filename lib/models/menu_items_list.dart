import '../navigation/routes.dart';

final menuItemsList = [
  {
    'title': Routes.home.title,
    'path': Routes.home.path,
  },
  {
    'title': Routes.projects.title,
    'path': Routes.projects.path,
  },
  {
    'title': Routes.blog.title,
    'path': Routes.blog.path,
  },
  {
    'title': Routes.contact.title,
    'path': Routes.contact.path,
  },
  {
    'title': Routes.nft.title,
    'path': Routes.nft.path,
  },
  {
    'title': Routes.login.title,
    'path': Routes.login.path,
    'isLoggedin': 'hide',
  },
  {
    'title': Routes.messages.title,
    'path': Routes.messages.path,
    'onlyAdmin': true,
    'isLoggedin': 'show',
  },
  {
    'title': 'Logout',
    'path': 'logout',
    'onlyAdmin': true,
    'isLoggedin': 'show',
  }
];
