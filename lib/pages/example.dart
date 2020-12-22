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
          ..src = 'https://repl.it/@akovalyo/42svminishell-1?lite=false'
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
        child: HtmlWidget(
          // the first parameter (`html`) is required
          '''
  <h1>Heading</h1>
  <h2>Heading</h2>
  <h3>Heading</h3>
  <h4>Heading</h4>
  <h5>Heading</h5>
  <h6>Heading</h6>
  <p>
    A paragraph with <strong>strong</strong>, <em>emphasized</em>
    and <span style="color: red">colored</span> text.
  </p>
  <details>
	<summary>Title</summary>
 
     TextTextTextTextTextText
     TextTextTextTextText
     TextTextTextText
     TextTextText
     TextText
     Text
 
 </details>
  ''',

          // all other parameters are optional, a few notable params:

          // specify custom styling for an element
          // see supported inline styling below
          customStylesBuilder: (element) {
            if (element.classes.contains('foo')) {
              return {'color': 'red'};
            }

            return null;
          },

          // render a custom widget
          // customWidgetBuilder: (element) {
          //   if (element.attributes['foo'] == 'bar') {
          //     return FooBarWidget();
          //   }

          //   return null;
          // },

          // set the default styling for text
          textStyle: TextStyle(fontSize: 14),

          // By default, `webView` is turned off because additional config
          // must be done for `PlatformView` to work on iOS.
          // https://pub.dev/packages/webview_flutter#ios
          // Make sure you have it configured before using.
          webView: true,
        ),
        //  Directionality(
        //   textDirection: TextDirection.ltr,
        //   child: HtmlElementView(
        //     viewType: createdViewId,
        //   ),
        // ),
      ),
    );
  }
}
