import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TrapeziumPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.yellow;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(40, 0);
    path.lineTo(80, 0);
    path.lineTo(0, 80);
    path.lineTo(0, 40);
    path.lineTo(40, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ProjectCard extends StatefulWidget {
  final ImageProvider imageProvider;
  final String title;
  final String description;
  final String label;
  final Widget? firstButton;
  final Widget? secondButton;

  ProjectCard({
    required this.imageProvider,
    this.title = '',
    this.description = '',
    this.label = '',
    this.firstButton,
    this.secondButton,
  });
  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  late Widget _image;
  late Widget _hoverWidget;
  late Widget _firstWidget;
  late Widget _secondWidget;
  Widget? _firstAnimatedWidget;
  Widget? _secondAnimatedWidget;

  @override
  void initState() {
    super.initState();
    _image = Image(fit: BoxFit.fitHeight, image: widget.imageProvider);

    _firstWidget = Stack(children: [
      _image,
      Container(
        child: CustomPaint(
          painter: TrapeziumPainter(),
        ),
      ),
      Container(
        transform: Matrix4.translationValues(-15.0, 50.0, 0)
          ..rotateZ(-math.pi / 4),
        width: 80,
        height: 30,
        child: Text(
          widget.label,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ]);

    _hoverWidget = Opacity(
      opacity: 0.35,
      child: _firstWidget,
    );

    _secondWidget = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Text(
              widget.description,
              style: TextStyle(fontSize: 20),
              softWrap: true,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
        widget.firstButton == null
            ? Container()
            : FittedBox(
                fit: BoxFit.scaleDown,
                child: widget.firstButton,
              ),
        widget.secondButton == null
            ? Container()
            : FittedBox(
                fit: BoxFit.scaleDown,
                child: widget.secondButton,
              ),
      ],
    );

    _firstAnimatedWidget = _firstWidget;
  }

  void _onEnter(PointerEvent details) {
    setState(() {
      _firstAnimatedWidget = _hoverWidget;
      _secondAnimatedWidget = _secondWidget;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _firstAnimatedWidget = _firstWidget;
      _secondAnimatedWidget = null;
    });
  }

  void _onTap() {
    if (_secondAnimatedWidget == null) {
      setState(() {
        _firstAnimatedWidget = _hoverWidget;
        _secondAnimatedWidget = _secondWidget;
      });
    } else {
      setState(() {
        _firstAnimatedWidget = _firstWidget;
        _secondAnimatedWidget = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size.height * 0.6;
    final _width = _size > 300 ? _size : 300;
    final _child = Stack(
      fit: StackFit.expand,
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: _firstAnimatedWidget,
        ),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 800),
          child: _secondAnimatedWidget,
          switchInCurve: Curves.easeInOutBack,
          switchOutCurve: Curves.decelerate,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      ],
    );

    return Column(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: _width as double,
          height: _width * 0.6,
          child: MouseRegion(
              onEnter: _onEnter,
              onExit: _onExit,
              child: GestureDetector(
                onTap: _onTap,
                child: _child,
              )),
        ),
      ],
    );
  }
}
