import 'package:flutter/material.dart';

const Set<MaterialState> interactiveStates = <MaterialState>{
  MaterialState.pressed,
  MaterialState.hovered,
  MaterialState.focused,
};

class ThemeColors {
  static const blackLight = Color(0xFF3F3F3F);
  static const blackDark = Color(0xFF202020);

  static const secondaryLight = Color(0xffffffff);
  static const secondaryDark = Color(0xFFBDB3B3);

  static const accentBlackLight = Color(0xFF353535);
  static const accentBlackDark = Color(0xFF2B2B2B);

  static const backgroundLight = Color(0xffffffff);
  static const backgroundDark = Color(0xFF747474);
  static const background2077 = Color(0xFFf3e500);

  static const accentLight = Color(0xFFA43C28);
  static const accentDark = Color(0xFF9F483D);

  static const akGrey = Color(0xFF707070);

  static const akAlertL = Color(0xFFA43C28);
  static const akAlertD = Color(0xFFA43C28);

  static const akHeadlineL = Color(0xFF2E2E2E);
  // static const headlineDark = Color(0xFFBDB3B3);

  static const cp2077 = Color(0xFFf3e500);
  static const cpBlue = Color(0xFF70C4F4);
}
