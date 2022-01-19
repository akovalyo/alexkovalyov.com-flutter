import 'package:flutter/material.dart';

class ScreenHelper {
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static double screenWidthDivided(BuildContext context, int percentage) {
    double width = MediaQuery.of(context).size.width;
    return width / 100 * percentage;
  }

  static double screenHeightDivided(BuildContext context, int percentage) {
    double height = MediaQuery.of(context).size.height;
    return height / 100 * percentage;
  }
}






// bool isDesktop() {
//   if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
//     return true;
//   }
//   return false;
// }

// Size screenSize(BuildContext context) {
//   return MediaQuery.of(context).size;
// }

// double screenWidthDivided({
//   @required BuildContext context,
//   double dividedBy = 1,
//   double reducedBy = 0.0,
// }) {
//   return (screenSize(context).width - reducedBy) / dividedBy;
// }

// double screenHeightDevided({
//   @required BuildContext context,
//   double dividedBy = 1,
//   double reducedBy = 0.0,
// }) {
//   return (screenSize(context).height - reducedBy) / dividedBy;
// }

// bool isLargeScreen(BuildContext context) {
//   return MediaQuery.of(context).size.width > 1200;
// }

// bool isMediumScreen(BuildContext context) {
//   return MediaQuery.of(context).size.width >= 800 &&
//       MediaQuery.of(context).size.width <= 1200;
// }

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

// void changeTitle(String str) {
//   String title = '';
//   if (str == '/' || str == 'Home') {
//     title = 'Alex Kovalyov';
//   } else if (titles.containsKey(str)) {
//     title = 'Alex Kovalyov - ${titles[str]}';
//   } else {
//     print(str);
//     title = str;
//   }

//   SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
//     label: title,
//     primaryColor: 4282335039,
//   ));
// }
