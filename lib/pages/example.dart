import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:ui' as ui;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class Example extends StatefulWidget {
  static const routeName = '/scroll';

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  String createdViewId = 'map_element';
//  void forWeb() {

//       // ignore: undefined_prefixed_name
//       ui.platformViewRegistry.registerViewFactory(
//           'hello-world-html',
//               (int viewId) => html.IFrameElement()
//             ..width = '640'
//             ..height = '360'
//             ..src = 'https://www.youtube.com/embed/IyFZznAk69U'
//             ..style.border = 'none');

//       Directionality(
//         textDirection: TextDirection.ltr,
//         child: Center(
//           child: SizedBox(
//             width: 200,
//             height: 200,
//             child: HtmlElementView(viewType: 'hello-world-html'),
//           ),
//         ),
//       );

//   }

  void initState() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        createdViewId,
        (int viewId) => html.IFrameElement()
          ..width = MediaQuery.of(context).size.width.toString() //'800'
          ..height = MediaQuery.of(context).size.height.toString() //'400'
          ..src = 'https://repl.it/@akovalyo/42svminishell?lite=false'
          //..src = 'https://formcarry.com/s/R81_ByjDvOmL'
          ..style.border = 'none');

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 70),
        // decoration: BoxDecoration(
        // color: Colors.white,
        // border: Border.all(color: Colors.grey[300], width: 1),
        // borderRadius: BorderRadius.all(Radius.circular(5))),
        width: 500,
        height: 800,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: HtmlElementView(
            viewType: createdViewId,
          ),
        ),
      ),
    );
  }
}
