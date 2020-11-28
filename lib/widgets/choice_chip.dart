import 'package:flutter/material.dart';

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
    return Column(
      children: <Widget>[
        ChoiceChip(
          avatar: Icon(Icons.brightness_5),
          label: Text(
            'Light',
          ),
          labelStyle: TextStyle(color: Colors.white),
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
          avatar: Icon(Icons.brightness_2),
          label: Text(
            'Dark',
          ),
          labelStyle: TextStyle(color: Colors.white),
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
      ],
    );
  }
}
