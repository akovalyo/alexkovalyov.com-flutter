import 'package:flutter/material.dart';

class NftFilterField extends StatefulWidget {
  final String title;
  final String currentChoice;
  final List<String> choices;
  final Function onSelected;
  const NftFilterField({
    Key? key,
    required this.title,
    required this.currentChoice,
    required this.choices,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<NftFilterField> createState() => _NftFilterFieldState();
}

class _NftFilterFieldState extends State<NftFilterField> {
  String _currentChoice = '';

  @override
  void initState() {
    _currentChoice = widget.currentChoice;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    return Container(
      constraints: BoxConstraints(
        maxWidth: (_screenWidth - 40) / 2,
      ),
      padding: EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 10,
        right: 5,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(50)),
        border: Border.all(width: 1),
      ),
      child: PopupMenuButton(
          tooltip: _currentChoice,
          initialValue: _currentChoice,
          child: Text(
            '${widget.title}: $_currentChoice',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).primaryColor,
            ),
            overflow: TextOverflow.clip,
            softWrap: false,
          ),
          color: Theme.of(context).primaryColor.withOpacity(0.9),
          onSelected: (value) {
            widget.onSelected(value);
            setState(() {
              _currentChoice = value as String;
            });
          },
          itemBuilder: (_) {
            return widget.choices.map((e) {
              return PopupMenuItem(
                value: e,
                textStyle: TextStyle(color: Theme.of(context).primaryColor),
                child: Text(e,
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor)),
              );
            }).toList();
          }),
    );
  }
}
