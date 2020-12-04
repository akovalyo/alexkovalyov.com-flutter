import 'package:flutter/material.dart';

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
