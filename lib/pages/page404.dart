import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:mysite/consts/consts.dart';
import 'package:mysite/page_elements/footer.dart';

const quotes = [
  '\"Don\'t panic.\"',
  '\"I\'m 50,000 times more intelligent than you, and even I don\'t know the answer.\"',
  '\"It gives me a headache just trying to think down to your level.\"',
  '\"Just when you think it can\'t get any worse, suddenly it gets even worse\"',
  '\"There is only one life-form as intelligent as me within thirty parsecs of here and that\'s me.\"',
  '\"The first ten million years were the worst, and the second ten million years, they were the worst too.\"',
  '\"Incredible... It\'s even worse than I thought it would be.\"',
  '\"I\'ve been talking to the main computer... It hates me.\"',
  '\"Life? Don\'t talk to me about life!\"',
  '\"This will all end in tears. I just know it.\"',
  '\"I could calculate your chance of survival, but you won\'t like it.\"',
  '\"I\'d give you advice, but you wouldn\'t listen. No one ever does.\"',
  '\"I think you ought to know I\'m feeling very depressed.\"',
  '\"Do you want me to sit in a corner and rust, or just fall apart where I\'m standing?\"',
  '\"The best conversation I had was over forty million years ago…. And that was with a coffee machine.\"',
  '\"Sounds awful.\"',
];

class Page404 extends StatefulWidget {
  @override
  _Page404State createState() => _Page404State();
}

class _Page404State extends State<Page404> {
  final random = Random();
  String _firstQuote;
  String _secondQuote = '';
  bool _first = true;

  @override
  void initState() {
    super.initState();

    _firstQuote = quotes[random.nextInt(quotes.length)];
  }

  void onTap() {
    if (_first) {
      _secondQuote = quotes[random.nextInt(quotes.length)];
    } else {
      _firstQuote = quotes[random.nextInt(quotes.length)];
    }

    setState(() {
      _first = !_first;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _height = _screenSize.height - appBarHeight - footerHeight;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text('Oops! Page not found',
                style: Theme.of(context).textTheme.headline4),
          ),
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).backgroundColor,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: _screenSize.width * 0.45,
                  ),
                  child: AnimatedCrossFade(
                    crossFadeState: _first
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 500),
                    firstChild: Text(
                      _firstQuote,
                      style: TextStyle(
                          fontSize: 28, color: Colors.black, height: 1),
                    ),
                    secondChild: Text(
                      _secondQuote,
                      style: TextStyle(
                          fontSize: 28, color: Colors.black, height: 1),
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: _screenSize.width * 0.45,
                  ),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: onTap,
                      child: Image(
                        fit: BoxFit.scaleDown,
                        image: AssetImage('assets/images/marvin.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _height < 0 ? Container() : Footer(),
      ],
    );
  }
}
