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

final ThemeData lightTheme = _akLightTheme();
final ThemeData darkTheme = _akDarkTheme();

ThemeData _akLightTheme() {
  final base = ThemeData.light();

  return base.copyWith(
    primaryColor: akBlackL,
    errorColor: akAlertL,
    accentColor: akAccent,
    textTheme: _akTextTheme(base.textTheme),
    primaryIconTheme: _akIconTheme(base.iconTheme, Colors.white),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
  );
}

ThemeData _akDarkTheme() {
  return ThemeData.dark().copyWith();
}

TextTheme _akTextTheme(TextTheme base) {
  return GoogleFonts.davidLibreTextTheme(
    base.copyWith(
      headline1: base.headline1.copyWith(fontSize: 64),
    ),
  );
}

IconThemeData _akIconTheme(IconThemeData original, Color color) {
  return original.copyWith(color: color);
}
