import 'package:flutter/material.dart';

// enum ScreenSize { Large, Medium, Small }

// ScreenSize screenSize(BuildContext context) {
//   final double _width = MediaQuery.of(context).size.width;

//   if (_width < 640)
//     return ScreenSize.Small;
//   else if (640 < _width && _width < 960)
//     return ScreenSize.Medium;
//   else
//     return ScreenSize.Large;
// }

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
