import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';
import 'package:mysite/consts/routes.dart';

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenWidthDivided({
  @required BuildContext context,
  double dividedBy = 1,
  double reducedBy = 0.0,
}) {
  return (screenSize(context).width - reducedBy) / dividedBy;
}

double screenHeightDevided({
  @required BuildContext context,
  double dividedBy = 1,
  double reducedBy = 0.0,
}) {
  return (screenSize(context).height - reducedBy) / dividedBy;
}

bool isSmallScreen(BuildContext context) {
  return MediaQuery.of(context).size.width < 800;
}

bool isLargeScreen(BuildContext context) {
  return MediaQuery.of(context).size.width > 1200;
}

bool isMediumScreen(BuildContext context) {
  return MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width <= 1200;
}

// bool isSameRoot(String newRouteName) {
//   bool isSameRoute = false;
//   navKey.currentState.popUntil((route) {
//     print(route.settings.name);
//     if (route.settings.name == newRouteName) {
//       isSameRoute = true;
//     }
//     return true;
//   });
//   return isSameRoute;
// }

String currentRoot() {
  String curr;

  navKey.currentState.popUntil((route) {
    curr = route.settings.name;
    return true;
  });
  return curr;
}

bool isDesktop() {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    return true;
  }
  return false;
}
