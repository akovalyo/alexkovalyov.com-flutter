import 'package:flutter/material.dart';

const Set<MaterialState> interactiveStates = <MaterialState>{
  MaterialState.pressed,
  MaterialState.hovered,
  MaterialState.focused,
};

class ThemeColors {
  //Light theme
  static const blackLight = Color(0xFF3F3F3F);
  static const secondaryLight = Color(0xffffffff);
  static const accentBlackLight = Color(0xFF353535);
  static const backgroundLight = Color(0xffffffff);
  static const accentLight = Color(0xFFA43C28);
  static const errorLight = Colors.red;

  //Dark Theme
  static const blackDark = Color(0xFF202020);
  static const secondaryDark = Color(0xFFBDB3B3);
  static const accentBlackDark = Color(0xFF2B2B2B);
  static const backgroundDark = Color(0xFF747474);
  static const accentDark = Color(0xFF9F483D);
  static const errorDark = Color(0xFFA43C28);
  static const headline = Color(0xFF2E2E2E);

  //2077 Theme
  static const background2077 = Color(0xFFf3e500);
  static const secondary2077 = Color(0xFF70C4F4);
}
