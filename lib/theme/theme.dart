import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//

const paddingLarge = 200.0;
const paddingSmall = 30.0;

// Colors

const akBlackL = Color(0xFF3F3F3F);
const akBlackD = Color(0xFF202020);

const akAccent = Color(0xFFFFDF6C);

const akGrey = Color(0xFF707070);

const akAlertL = Color(0xFFA43C28);
const akAlertD = Color(0xFFA43C28);

//

final ThemeData lightTheme = _myLightTheme();
final ThemeData darkTheme = _myDarkTheme();

ThemeData _myLightTheme() {
  final base = ThemeData.light();

  return base.copyWith(
    primaryColor: akBlackL,
    errorColor: akAlertL,
    textTheme: GoogleFonts.davidLibreTextTheme(
      base.textTheme.copyWith(
        headline1: base.textTheme.headline1.copyWith(fontSize: 64),
      ),
    ),
  );
}

ThemeData _myDarkTheme() {
  return ThemeData.dark().copyWith();
}
