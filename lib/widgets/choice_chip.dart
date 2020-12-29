import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import 'package:mysite/consts/colors.dart';
import 'package:mysite/theme/theme.dart';

class ThemeChoiceChip extends StatefulWidget {
  final ValueChanged<Brightness> onSelectedTheme;

  ThemeChoiceChip({this.onSelectedTheme});

  @override
  _ThemeChoiceChipState createState() => _ThemeChoiceChipState();
}

class _ThemeChoiceChipState extends State<ThemeChoiceChip> {
  @override
  Widget build(BuildContext context) {
    int _theme = Theme.of(context).brightness == Brightness.light ? 0 : 1;
    _theme = Theme.of(context).backgroundColor == cp2077 ? 2 : _theme;
    return Column(
      children: <Widget>[
        ChoiceChip(
          avatar: Icon(
            Icons.brightness_5,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          label: Text(
            'Light',
          ),
          labelStyle: TextStyle(color: Theme.of(context).secondaryHeaderColor),
          backgroundColor: Color(0x00000000),
          selectedColor: Colors.red,
          selected: _theme == 0,
          onSelected: (_) {
            widget.onSelectedTheme(Brightness.light);
            setState(() {
              _theme = 0;
            });
          },
        ),
        ChoiceChip(
          avatar: Icon(
            Icons.brightness_2,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          label: Text(
            'Dark',
          ),
          labelStyle: TextStyle(color: Theme.of(context).secondaryHeaderColor),
          backgroundColor: Color(0x00000000),
          selectedColor: Theme.of(context).accentColor,
          selected: _theme == 1,
          onSelected: (_) {
            widget.onSelectedTheme(Brightness.dark);
            setState(() {
              _theme = 1;
            });
          },
        ),
        Divider(),
        ChoiceChip(
          avatar: CircleAvatar(
            child: Image(image: AssetImage('assets/images/cyberpunk.png')),
          ),
          label: Text(
            '2077',
          ),
          labelStyle: TextStyle(color: Theme.of(context).buttonColor),
          backgroundColor: Color(0x00000000),
          selectedColor: cp2077,
          selected: _theme == 2,
          onSelected: (_) {
            DynamicTheme.of(context)
                .setThemeData(akTheme(Brightness.dark, '2077'));
            setState(() {
              _theme = 2;
            });
          },
        ),
      ],
    );
  }
}
