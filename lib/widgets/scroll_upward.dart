import 'package:flutter/material.dart';

class ScrollUpward extends StatefulWidget {
  final controller;
  final double visiblePosition;
  final double paddingRight;

  ScrollUpward(
    this.controller, {
    this.visiblePosition = 0.0,
    this.paddingRight = 0.0,
  });

  @override
  _ScrollUpwardState createState() => _ScrollUpwardState();
}

class _ScrollUpwardState extends State<ScrollUpward> {
  double _scrollPos = 0;
  double _upwardArrowPadding = 0;
  bool _visible = false;

  _scrollListener() {
    var _low = widget.controller.position.maxScrollExtent;
    _scrollPos = widget.controller.position.pixels;

    if (_scrollPos > widget.visiblePosition && _visible == false) {
      setState(() {
        _visible = true;
      });
    }
    if (_scrollPos < widget.visiblePosition) {
      setState(() {
        _visible = false;
      });
    }

    if (_scrollPos > (_low * 0.9)) {
      setState(() {
        _upwardArrowPadding = 120 * (1 - ((_low - _scrollPos) / (_low * 0.1)));
      });
    }
  }

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.only(
            bottom: _upwardArrowPadding, right: widget.paddingRight),
        child: IconButton(
          hoverColor: Color(0x000000),
          iconSize: 34,
          color: Theme.of(context).primaryColor,
          onPressed: () {
            widget.controller.animateTo(
              0,
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            );
          },
          icon: Icon(Icons.arrow_upward),
        ),
      ),
    );
  }
}
