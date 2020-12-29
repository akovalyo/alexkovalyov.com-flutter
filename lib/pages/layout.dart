// import 'package:flutter/material.dart';

// import 'package:mysite/consts/consts.dart';
// import 'package:mysite/helpers.dart';
// import 'package:mysite/page_elements/ak_app_bar.dart';
// import 'package:mysite/page_elements/drawer.dart';

// class Layout extends StatelessWidget {
//   final Widget child;

//   Layout({Key key, @required this.child});

//   @override
//   Widget build(BuildContext context) {
//     var _screenSize = screenSize(context);
//     return Scaffold(
//       backgroundColor: Theme.of(context).backgroundColor,
//       appBar: PreferredSize(
//         preferredSize: Size(_screenSize.width, appBarHeight),
//         child: AkAppBar(),
//       ),
//       drawer: AkDrawer(),
//       body: Scrollbar(
//         radius: Radius.circular(20),
//         child: NotificationListener<ScrollNotification>(
//           onNotification: (scrollNotification) {
//             return false;
//           },
//           child: Stack(
//             alignment: Alignment.center,
//             children: <Widget>[
//               child,
//             ],
//           ),
//         ),
//       ),

//       // AkScrollbar(
//       //   width: 10,
//       //   backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
//       //   color: Theme.of(context).primaryColor,
//       //   child: child,
//       // ),
//     );
//   }
// }
