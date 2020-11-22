import 'package:flutter/material.dart';

class AkDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: AkMenu(29, context).column(),
        ),
      ),
    );
  }
}

const MENU = const [
  {
    'title': 'menu_1',
    'link': '/',
  },
  {
    'title': 'menu_2',
    'link': '/scroll',
  }
];

class AkMenu {
  final double fontSize;
  final BuildContext context;

  AkMenu(this.fontSize, this.context);

  List<Widget> get _getMenu {
    final _listIterator = MENU.iterator;
    final List<Widget> _list = [];

    while (_listIterator.moveNext()) {
      _list.add(
        Container(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed(_listIterator.current['link']);
              print(_listIterator.current['title']);
            },
            child: Text(
              _listIterator.current['title'],
              style: TextStyle(
                fontSize: fontSize,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
      );
      _list.add(Divider());
    }
    return _list;

    // return [
    //   for (var elem in MENU)
    //     Container(
    //       padding: EdgeInsets.only(bottom: 10, top: 10),
    //       child: FlatButton(
    //         onPressed: () {
    //           Navigator.of(context).pushNamed(elem['link']);
    //           print(elem['title']);
    //         },
    //         child: Text(
    //           elem['title'],
    //           style: TextStyle(fontSize: fontSize),
    //         ),
    //       ),
    //     ),
    // ];
  }

  Widget column() {
    return Column(
      children: _getMenu,
    );
  }

  Widget row() {
    return Row(
      children: _getMenu,
    );
  }
}

// class AkMenu extends StatelessWidget {
//   final int fontSize;

//   AkMenu(this.fontSize);

//   final List<Widget> _list = [
//     InkWell(),

//   ];

//   Widget column(){
//     return Container();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return List<Widget>[];
//   }
// }
