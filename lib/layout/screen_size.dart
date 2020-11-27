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
