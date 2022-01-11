import 'package:flutter/material.dart';
import 'package:dynamic_themes/dynamic_themes.dart';

import '../consts/colors.dart';
import '../theme/theme.dart';

class ThemeChoiceChip extends StatefulWidget {
  @override
  _ThemeChoiceChipState createState() => _ThemeChoiceChipState();
}

class _ThemeChoiceChipState extends State<ThemeChoiceChip> {
  @override
  Widget build(BuildContext context) {
    int _theme = DynamicTheme.of(context)!.themeId;
    // _theme = Theme.of(context).backgroundColor == cp2077 ? 2 : _theme;
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: ChoiceChip(
            avatar: Icon(
              Icons.brightness_5,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            label: Text(
              'Light',
            ),
            labelStyle:
                TextStyle(color: Theme.of(context).secondaryHeaderColor),
            backgroundColor: Color(0x00000000),
            selectedColor: Colors.red,
            selected: _theme == 0,
            onSelected: (_) {
              DynamicTheme.of(context)?.setTheme(AppThemes.light);
              setState(() {
                _theme = 0;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: ChoiceChip(
            avatar: Icon(
              Icons.brightness_2,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            label: Text(
              'Dark',
            ),
            labelStyle:
                TextStyle(color: Theme.of(context).secondaryHeaderColor),
            backgroundColor: Color(0x00000000),
            selectedColor: Theme.of(context).colorScheme.secondary,
            selected: _theme == 1,
            onSelected: (_) {
              DynamicTheme.of(context)?.setTheme(AppThemes.dark);
              setState(() {
                _theme = 1;
              });
            },
          ),
        ),
        ChoiceChip(
          avatar: CircleAvatar(
            child: Image(image: AssetImage('assets/images/cyberpunk.png')),
          ),
          label: Text(
            '2077',
          ),
          labelStyle:
              TextStyle(color: _theme == 2 ? Colors.black : Colors.white),
          backgroundColor: Color(0x00000000),
          selectedColor: cp2077,
          selected: _theme == 2,
          onSelected: (_) {
            DynamicTheme.of(context)?.setTheme(AppThemes.theme2077);
            setState(() {
              _theme = 2;
            });
          },
        ),
      ],
    );
  }
}
