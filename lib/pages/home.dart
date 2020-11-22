import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:mysite/theme/adaptive.dart';
import 'package:mysite/theme/theme.dart';
import 'package:mysite/theme/image_placeholder.dart';
import 'package:mysite/widgets/ak_app_bar.dart';
import 'package:mysite/widgets/drawer.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController;
  double _scrollPos = 0;
  double opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPos = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    opacity = _scrollPos > _screenSize.height * 0.5
        ? 1
        : _scrollPos / (_screenSize.height * 0.5);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(_screenSize.width, 70),
        child: AkAppBar(opacity),
      ),
      drawer: AkDrawer(),
      body: Center(
        child: Container(
            height: 400,
            child: Text(
              'Hello',
              style: Theme.of(context).textTheme.headline1,
            )),
      ),
    );

    //   Material(
    //     color: Colors.amber,
    //     child: Padding(
    //       padding: EdgeInsets.only(top: 10),
    //       child: Scaffold(
    //         backgroundColor: Colors.amber,
    //         appBar: AppBar(
    //           backgroundColor: Colors.amber,
    //           elevation: 0,
    //           flexibleSpace: FlexibleBar(),
    //         ),
    //         body: null,
    //       ),
    //     ),
    //   );
  }
}

// class FlexibleBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//             horizontal:
//                 scrSize == ScreenSize.Large ? paddingLarge : paddingSmall),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             FadeInImageAny(
//               image: AssetImage('assets/images/site/ak.png'),
//               placeholder: SizedBox(
//                 width: 40,
//                 height: 60,
//               ),
//               width: 40,
//               height: 60,
//             ),
//             Container(
//               child: Row(
//                 children: [
//                   TextButton(
//                     child: Text('Button1'),
//                     onPressed: () {},
//                   ),
//                   TextButton(
//                     child: Text('Button2'),
//                     onPressed: () {},
//                   ),
//                   TextButton(
//                     child: Text('Button3'),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
