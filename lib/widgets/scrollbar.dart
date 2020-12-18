// import 'dart:async';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:mysite/models/scroll.dart';

// class AkScrollbar extends StatefulWidget {
//   final Widget child;
//   //final ScrollController scrollController;
//   final double width;
//   final double scrollSizeRatio;
//   final Color color;
//   final Color backgroundColor;
//   final bool isAlwaysShown;
//   final int scrollFadeTimer;
//   final BuildContext ctx;

//   AkScrollbar({
//     @required this.child,
//     //@required this.scrollController,
//     this.width = 15,
//     this.scrollSizeRatio = 0.4,
//     this.color = Colors.black54,
//     this.backgroundColor = Colors.grey,
//     this.isAlwaysShown = false,
//     this.scrollFadeTimer = 5,
//     this.ctx,
//   })  : assert(child != null),
//         assert(width != 0),
//         assert(scrollSizeRatio > 0.0 && scrollSizeRatio < 1.0);

//   @override
//   _AkScrollbarState createState() => _AkScrollbarState();
// }

// class _AkScrollbarState extends State<AkScrollbar> {
//   ScrollController scrollController;
//   double _scrollPos = 0;
//   bool _isUpdating;
//   Timer _timer;

//   _scrollListener() {
//     setState(() {
//       _scrollPos = scrollController.position.pixels;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     scrollController = ScrollController();
//     scrollController.addListener(_scrollListener);
//     _isUpdating = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     var scrollData = Provider.of<Scroll>(context, listen: false);
//     var _screenSize = MediaQuery.of(context).size;
//     double _scrollHeight = _screenSize.height * widget.scrollSizeRatio;
//     double _topMargin = scrollController.hasClients
//         ? ((_screenSize.height *
//                 _scrollPos /
//                 scrollController.position.maxScrollExtent) -
//             (_scrollHeight *
//                 _scrollPos /
//                 scrollController.position.maxScrollExtent))
//         : 0;

//     return NotificationListener<ScrollNotification>(
//       onNotification: (notification) {
//         if (notification.depth == 0) {
//           if (notification is ScrollUpdateNotification) {
//             _timer.cancel();
//             setState(() {
//               _isUpdating = true;
//             });
//           } else {
//             _timer = Timer(Duration(seconds: widget.scrollFadeTimer), () {
//               setState(() {
//                 _isUpdating = false;
//               });
//             });
//           }
//         }
//         return true;
//       },
//       child: ConstrainedBox(
//         constraints: BoxConstraints(maxHeight: 500),
//         child: Stack(
//           children: [
//             SingleChildScrollView(
//               controller: scrollController,
//               child: widget.child,
//             ),
//             AnimatedOpacity(
//               opacity: widget.isAlwaysShown
//                   ? 1
//                   : scrollController.hasClients
//                       ? _isUpdating
//                           ? 1
//                           : 0
//                       : 0,
//               duration: Duration(milliseconds: 200),
//               child: Container(
//                 alignment: Alignment.centerRight,
//                 height: _screenSize.height,
//                 width: widget.width + 2,
//                 margin: EdgeInsets.only(
//                   left: _screenSize.width - widget.width + 2,
//                 ),
//                 color: widget.backgroundColor,
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child: GestureDetector(
//                     child: Container(
//                       height: _scrollHeight,
//                       width: widget.width,
//                       margin: EdgeInsets.only(
//                         left: 1.0,
//                         right: 1.0,
//                         top: _topMargin,
//                       ),
//                       decoration: BoxDecoration(
//                         color: widget.color,
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(3.0),
//                         ),
//                       ),
//                     ),
//                     onTapCancel: () {
//                       _timer = Timer(Duration(seconds: 5), () {
//                         setState(() {
//                           _isUpdating = false;
//                         });
//                       });
//                     },
//                     onTapDown: (details) {
//                       _timer.cancel();
//                       setState(() {
//                         _isUpdating = true;
//                       });
//                     },
//                     onVerticalDragUpdate: (dragUpdate) {
//                       scrollController.position.moveTo(dragUpdate
//                               .globalPosition.dy +
//                           dragUpdate.globalPosition.dy *
//                               (_scrollPos /
//                                   scrollController.position.maxScrollExtent) -
//                           (_scrollHeight *
//                               _scrollPos /
//                               scrollController.position.maxScrollExtent));

//                       setState(() {
//                         if (dragUpdate.globalPosition.dy >= 0 &&
//                             _scrollPos <=
//                                 scrollController.position.maxScrollExtent) {
//                           _scrollPos = dragUpdate.globalPosition.dy +
//                               dragUpdate.globalPosition.dy *
//                                   (_scrollPos /
//                                       scrollController
//                                           .position.maxScrollExtent) -
//                               (_scrollHeight *
//                                   _scrollPos /
//                                   scrollController.position.maxScrollExtent);
//                         }
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             Text(''),
//           ],
//         ),
//       ),
//     );
//   }
// }
