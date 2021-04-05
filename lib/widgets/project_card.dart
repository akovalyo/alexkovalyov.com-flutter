import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProjectCard extends StatefulWidget {
  final ImageProvider imageProvider;
  final String title;
  final String description;
  final Widget? firstButton;
  final Widget? secondButton;

  ProjectCard({
    required this.imageProvider,
    this.title = '',
    this.description = '',
    this.firstButton,
    this.secondButton,
  });
  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  late Widget _image;
  late Widget _hoverImage;
  late Widget _secondWidget;
  Widget? _firstAnimatedWidget;
  Widget? _secondAnimatedWidget;

  @override
  void initState() {
    super.initState();
    _image = Image(fit: BoxFit.fitHeight, image: widget.imageProvider);
    _hoverImage = Opacity(
      opacity: 0.35,
      child: _image,
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

    _firstAnimatedWidget = _image;
  }

  void _onEnter(PointerEvent details) {
    setState(() {
      _firstAnimatedWidget = _hoverImage;
      _secondAnimatedWidget = _secondWidget;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _firstAnimatedWidget = _image;
      _secondAnimatedWidget = null;
    });
  }

  void _onTap() {
    if (_secondAnimatedWidget == null) {
      setState(() {
        _firstAnimatedWidget = _hoverImage;
        _secondAnimatedWidget = _secondWidget;
      });
    } else {
      setState(() {
        _firstAnimatedWidget = _image;
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
