import 'package:flutter/material.dart';

import 'package:mysite/consts/colors.dart';

class AppThemes {
  static const int light = 0;
  static const int dark = 1;
  static const int theme2077 = 2;

  static IconThemeData akIconTheme(IconThemeData original, Color color) {
    return original.copyWith(color: color);
  }

  static ThemeData themeDataLight() {
    return ThemeData.light().copyWith(
      // brightness: brightness,
      primaryColor: akBlackL,
      primaryColorDark: akBlackLAcc,
      secondaryHeaderColor: Colors.white,
      backgroundColor: Colors.white,
      errorColor: akAlertL,
      splashColor: Color(0x00000000),
      highlightColor: Color(0x00000000),
      hoverColor: Color(0x00000000),
      textTheme: ThemeData.light().textTheme.copyWith(
            caption: ThemeData.light().textTheme.caption!.copyWith(
                  fontFamily: 'DavidLibre',
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  height: 1.5,
                  color: akAccentL,
                  decoration: TextDecoration.underline,
                ),
            bodyText1: ThemeData.light().textTheme.bodyText1!.copyWith(
                  fontFamily: 'DavidLibre',
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  height: 1.5,
                  color: Colors.white,
                ),
            bodyText2: ThemeData.light().textTheme.bodyText2!.copyWith(
                  fontFamily: 'DavidLibre',
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  height: 1.5,
                ),
            headline3: ThemeData.light().textTheme.headline3!.copyWith(
                  fontFamily: 'DavidLibre',
                  color: akHeadlineL,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
            headline4: ThemeData.light().textTheme.headline4!.copyWith(
                  fontFamily: 'DavidLibre',
                  color: akHeadlineL,
                  fontWeight: FontWeight.bold,
                ),
            headline5: ThemeData.light().textTheme.headline5!.copyWith(
                  fontFamily: 'DavidLibre',
                  color: akHeadlineL,
                  fontSize: 28,
                ),
            headline6: ThemeData.light().textTheme.headline6!.copyWith(
                  fontFamily: 'DavidLibre',
                  color: akHeadlineL,
                  fontSize: 24,
                ),
            button: ThemeData.light().textTheme.button!.copyWith(
                  fontFamily: 'DavidLibre',
                  color: Colors.white,
                ),
          ),
      canvasColor: akBlackL,
      iconTheme: akIconTheme(ThemeData.light().iconTheme, Colors.white),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        buttonColor: akBlackL,
      ),
      colorScheme: ThemeData.light().colorScheme.copyWith(
            secondary: akAccentL,
          ),
    );
  }

  static ThemeData themeDataDark() {
    return ThemeData.dark().copyWith(
      // brightness: brightness,
      primaryColor: akBlackD,
      primaryColorDark: akBlackDAcc,
      backgroundColor: akBackD,
      secondaryHeaderColor: akHeadlineD,
      errorColor: akAlertD,
      splashColor: Color(0x00000000),
      highlightColor: Color(0x00000000),
      hoverColor: Color(0x00000000),
      textTheme: ThemeData.dark().textTheme.copyWith(
            caption: ThemeData.dark().textTheme.caption!.copyWith(
                  fontFamily: 'DavidLibre',
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  height: 1.5,
                  color: akAccentD,
                  decoration: TextDecoration.underline,
                ),
            bodyText1: ThemeData.dark().textTheme.bodyText1!.copyWith(
                  fontFamily: 'DavidLibre',
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  height: 1.5,
                  color: akHeadlineD,
                ),
            bodyText2: ThemeData.dark().textTheme.bodyText2!.copyWith(
                  fontFamily: 'DavidLibre',
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  height: 1.5,
                  color: akHeadlineD,
                ),
            headline3: ThemeData.dark().textTheme.headline3!.copyWith(
                  fontFamily: 'DavidLibre',
                  color: akHeadlineL,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
            headline4: ThemeData.dark().textTheme.headline4!.copyWith(
                  fontFamily: 'DavidLibre',
                  color: akHeadlineD,
                  fontWeight: FontWeight.bold,
                ),
            headline5: ThemeData.dark().textTheme.headline5!.copyWith(
                  fontFamily: 'DavidLibre',
                  color: akHeadlineD,
                  fontSize: 28,
                ),
            headline6: ThemeData.dark().textTheme.headline6!.copyWith(
                  fontFamily: 'DavidLibre',
                  color: akHeadlineD,
                  fontSize: 24,
                ),
            button: ThemeData.dark().textTheme.button!.copyWith(
                  fontFamily: 'DavidLibre',
                  color: Colors.white,
                ),
          ),
      canvasColor: akBlackL,
      iconTheme: akIconTheme(ThemeData.dark().iconTheme, Colors.white),
      buttonTheme: const ButtonThemeData(
        highlightColor: Color(0x00000000),
        splashColor: Color(0x00000000),
        hoverColor: Color(0x00000000),
        buttonColor: Color(0x00000000),
        focusColor: Color(0x00000000),
        textTheme: ButtonTextTheme.primary,
      ),
      colorScheme: ThemeData.light().colorScheme.copyWith(
            secondary: akAccentD,
          ),
    );
  }

  static ThemeData themeData2077() {
    return ThemeData.light().copyWith(
      // brightness: brightness,
      primaryColor: akBlackL,
      secondaryHeaderColor: cp2077,
      primaryColorDark: akBlackLAcc,
      backgroundColor: cp2077,
      errorColor: akAlertL,
      splashColor: Color(0x00000000),
      highlightColor: Color(0x00000000),
      hoverColor: Color(0x00000000),
      textTheme: ThemeData.light().textTheme.copyWith(
            caption: ThemeData.light().textTheme.caption!.copyWith(
                  fontFamily: 'DavidLibre',
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  height: 1.5,
                  color: cpBlue,
                  decoration: TextDecoration.underline,
                ),
            bodyText1: ThemeData.light().textTheme.bodyText1!.copyWith(
                  fontFamily: 'DavidLibre',
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  height: 1.5,
                  color: cp2077,
                ),
            bodyText2: ThemeData.light().textTheme.bodyText2!.copyWith(
                  fontFamily: 'DavidLibre',
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  height: 1.5,
                ),
            headline3: ThemeData.light().textTheme.headline3!.copyWith(
                  fontFamily: 'Cyberpunk',
                  color: Colors.black,
                  fontSize: 40,
                ),
            headline4: ThemeData.light().textTheme.headline4!.copyWith(
                  fontFamily: 'Cyberpunk',
                  color: cpBlue,
                ),
            headline5: ThemeData.light().textTheme.headline5!.copyWith(
                  fontFamily: 'Cyberpunk',
                  color: cpBlue,
                  fontSize: 28,
                ),
            headline6: ThemeData.light().textTheme.headline6!.copyWith(
                  fontFamily: 'Cyberpunk',
                  color: cpBlue,
                  fontSize: 24,
                ),
            button: ThemeData.light().textTheme.button!.copyWith(
                  fontFamily: 'DavidLibre',
                  color: Colors.white,
                ),
          ),
      canvasColor: akBlackL,
      iconTheme: akIconTheme(ThemeData.light().iconTheme, cpBlue),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        buttonColor: Colors.black,
      ),
      colorScheme: ThemeData.light().colorScheme.copyWith(
            secondary: cpBlue,
          ),
    );
  }
}

// ThemeData akTheme(Brightness brightness, String? theme) {
//   if (theme == '2077') {
//     return ThemeData.light().copyWith(
//       brightness: brightness,
//       primaryColor: akBlackL,
//       secondaryHeaderColor: cp2077,
//       primaryColorDark: akBlackLAcc,
//       backgroundColor: cp2077,
//       errorColor: akAlertL,
//       splashColor: Color(0x00000000),
//       highlightColor: Color(0x00000000),
//       hoverColor: Color(0x00000000),
//       textTheme: ThemeData.light().textTheme.copyWith(
//             caption: ThemeData.light().textTheme.caption!.copyWith(
//                   fontFamily: 'DavidLibre',
//                   fontWeight: FontWeight.w100,
//                   fontSize: 20,
//                   height: 1.5,
//                   color: cpBlue,
//                   decoration: TextDecoration.underline,
//                 ),
//             bodyText1: ThemeData.light().textTheme.bodyText1!.copyWith(
//                   fontFamily: 'DavidLibre',
//                   fontWeight: FontWeight.w100,
//                   fontSize: 20,
//                   height: 1.5,
//                   color: cp2077,
//                 ),
//             bodyText2: ThemeData.light().textTheme.bodyText2!.copyWith(
//                   fontFamily: 'DavidLibre',
//                   fontWeight: FontWeight.w100,
//                   fontSize: 20,
//                   height: 1.5,
//                 ),
//             headline3: ThemeData.light().textTheme.headline3!.copyWith(
//                   fontFamily: 'Cyberpunk',
//                   color: Colors.black,
//                   fontSize: 40,
//                 ),
//             headline4: ThemeData.light().textTheme.headline4!.copyWith(
//                   fontFamily: 'Cyberpunk',
//                   color: cpBlue,
//                 ),
//             headline5: ThemeData.light().textTheme.headline5!.copyWith(
//                   fontFamily: 'Cyberpunk',
//                   color: cpBlue,
//                   fontSize: 28,
//                 ),
//             headline6: ThemeData.light().textTheme.headline6!.copyWith(
//                   fontFamily: 'Cyberpunk',
//                   color: cpBlue,
//                   fontSize: 24,
//                 ),
//             button: ThemeData.light().textTheme.button!.copyWith(
//                   fontFamily: 'DavidLibre',
//                   color: Colors.white,
//                 ),
//           ),
//       canvasColor: akBlackL,
//       iconTheme: _akIconTheme(ThemeData.light().iconTheme, cpBlue),
//       buttonTheme: const ButtonThemeData(
//         textTheme: ButtonTextTheme.primary,
//         buttonColor: Colors.black,
//       ),
//       colorScheme: ThemeData.light().colorScheme.copyWith(
//             secondary: cpBlue,
//           ),
//     );
//   }

//   return brightness == Brightness.light
//       ? ThemeData.light().copyWith(
//           brightness: brightness,
//           primaryColor: akBlackL,
//           primaryColorDark: akBlackLAcc,
//           secondaryHeaderColor: Colors.white,
//           backgroundColor: Colors.white,
//           errorColor: akAlertL,
//           splashColor: Color(0x00000000),
//           highlightColor: Color(0x00000000),
//           hoverColor: Color(0x00000000),
//           textTheme: ThemeData.light().textTheme.copyWith(
//                 caption: ThemeData.light().textTheme.caption!.copyWith(
//                       fontFamily: 'DavidLibre',
//                       fontWeight: FontWeight.w100,
//                       fontSize: 20,
//                       height: 1.5,
//                       color: akAccentL,
//                       decoration: TextDecoration.underline,
//                     ),
//                 bodyText1: ThemeData.light().textTheme.bodyText1!.copyWith(
//                       fontFamily: 'DavidLibre',
//                       fontWeight: FontWeight.w100,
//                       fontSize: 20,
//                       height: 1.5,
//                       color: Colors.white,
//                     ),
//                 bodyText2: ThemeData.light().textTheme.bodyText2!.copyWith(
//                       fontFamily: 'DavidLibre',
//                       fontWeight: FontWeight.w100,
//                       fontSize: 20,
//                       height: 1.5,
//                     ),
//                 headline3: ThemeData.light().textTheme.headline3!.copyWith(
//                       fontFamily: 'DavidLibre',
//                       color: akHeadlineL,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 40,
//                     ),
//                 headline4: ThemeData.light().textTheme.headline4!.copyWith(
//                       fontFamily: 'DavidLibre',
//                       color: akHeadlineL,
//                       fontWeight: FontWeight.bold,
//                     ),
//                 headline5: ThemeData.light().textTheme.headline5!.copyWith(
//                       fontFamily: 'DavidLibre',
//                       color: akHeadlineL,
//                       fontSize: 28,
//                     ),
//                 headline6: ThemeData.light().textTheme.headline6!.copyWith(
//                       fontFamily: 'DavidLibre',
//                       color: akHeadlineL,
//                       fontSize: 24,
//                     ),
//                 button: ThemeData.light().textTheme.button!.copyWith(
//                       fontFamily: 'DavidLibre',
//                       color: Colors.white,
//                     ),
//               ),
//           canvasColor: akBlackL,
//           iconTheme: _akIconTheme(ThemeData.light().iconTheme, Colors.white),
//           buttonTheme: ButtonThemeData(
//             textTheme: ButtonTextTheme.primary,
//             buttonColor: akBlackL,
//           ),
//           colorScheme: ThemeData.light().colorScheme.copyWith(
//                 secondary: akAccentL,
//               ),
//         )
//       : ThemeData.dark().copyWith(
//           brightness: brightness,
//           primaryColor: akBlackD,
//           primaryColorDark: akBlackDAcc,
//           backgroundColor: akBackD,
//           secondaryHeaderColor: akHeadlineD,
//           errorColor: akAlertD,
//           splashColor: Color(0x00000000),
//           highlightColor: Color(0x00000000),
//           hoverColor: Color(0x00000000),
//           textTheme: ThemeData.dark().textTheme.copyWith(
//                 caption: ThemeData.dark().textTheme.caption!.copyWith(
//                       fontFamily: 'DavidLibre',
//                       fontWeight: FontWeight.w100,
//                       fontSize: 20,
//                       height: 1.5,
//                       color: akAccentD,
//                       decoration: TextDecoration.underline,
//                     ),
//                 bodyText1: ThemeData.dark().textTheme.bodyText1!.copyWith(
//                       fontFamily: 'DavidLibre',
//                       fontWeight: FontWeight.w100,
//                       fontSize: 20,
//                       height: 1.5,
//                       color: akHeadlineD,
//                     ),
//                 bodyText2: ThemeData.dark().textTheme.bodyText2!.copyWith(
//                       fontFamily: 'DavidLibre',
//                       fontWeight: FontWeight.w100,
//                       fontSize: 20,
//                       height: 1.5,
//                       color: akHeadlineD,
//                     ),
//                 headline3: ThemeData.dark().textTheme.headline3!.copyWith(
//                       fontFamily: 'DavidLibre',
//                       color: akHeadlineL,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 40,
//                     ),
//                 headline4: ThemeData.dark().textTheme.headline4!.copyWith(
//                       fontFamily: 'DavidLibre',
//                       color: akHeadlineD,
//                       fontWeight: FontWeight.bold,
//                     ),
//                 headline5: ThemeData.dark().textTheme.headline5!.copyWith(
//                       fontFamily: 'DavidLibre',
//                       color: akHeadlineD,
//                       fontSize: 28,
//                     ),
//                 headline6: ThemeData.dark().textTheme.headline6!.copyWith(
//                       fontFamily: 'DavidLibre',
//                       color: akHeadlineD,
//                       fontSize: 24,
//                     ),
//                 button: ThemeData.dark().textTheme.button!.copyWith(
//                       fontFamily: 'DavidLibre',
//                       color: Colors.white,
//                     ),
//               ),
//           canvasColor: akBlackL,
//           iconTheme: _akIconTheme(ThemeData.dark().iconTheme, Colors.white),
//           buttonTheme: const ButtonThemeData(
//             highlightColor: Color(0x00000000),
//             splashColor: Color(0x00000000),
//             hoverColor: Color(0x00000000),
//             buttonColor: Color(0x00000000),
//             focusColor: Color(0x00000000),
//             textTheme: ButtonTextTheme.primary,
//           ),
//           colorScheme: ThemeData.light().colorScheme.copyWith(
//                 secondary: akAccentD,
//               ),
//         );
// }


