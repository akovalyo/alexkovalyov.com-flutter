import 'package:flutter/material.dart';
import 'package:animated_icon_button/animated_icon_button.dart';

import 'package:mysite/router/routes.dart';

class OverlayMenu extends StatefulWidget {
  final List links;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color iconColor;
  final Color buttonColor;
  final ValueChanged<int> onChange;

  const OverlayMenu({
    @required this.links,
    this.borderRadius,
    this.backgroundColor,
    this.iconColor,
    this.buttonColor,
    this.onChange,
  });
  @override
  _OverlayMenuState createState() => _OverlayMenuState();
}

class _OverlayMenuState extends State<OverlayMenu>
    with SingleTickerProviderStateMixin {
  GlobalKey _key;
  bool _isMenuOpen = false;
  Offset _buttonPosition;
  Size _buttonSize;
  OverlayEntry _overlayEntry;
  BorderRadius _borderRadius;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _borderRadius = widget.borderRadius ?? BorderRadius.circular(4);
    _key = LabeledGlobalKey("button_icon");
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  findButton() {
    RenderBox renderBox = _key.currentContext.findRenderObject();
    _buttonSize = Size(60, 40);
    _buttonPosition = renderBox.localToGlobal(Offset(-20, 0));
  }

  void closeMenu() {
    _overlayEntry.remove();
    _animationController.reverse();
    _isMenuOpen = !_isMenuOpen;
  }

  void openMenu() {
    findButton();
    _animationController.forward();
    _overlayEntry = _overlayEntryBuilder();
    navKey.currentState.overlay.insert(_overlayEntry);
    _isMenuOpen = !_isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      decoration: BoxDecoration(
        color: widget.buttonColor,
        borderRadius: _borderRadius,
      ),
      child: AnimatedIconButton(
        onPressed: () {
          if (_isMenuOpen) {
            closeMenu();
          } else {
            openMenu();
          }
        },
        startIcon: Icon(
          Icons.more_vert,
        ),
        endIcon: Icon(
          Icons.close,
        ),
        duration: Duration(milliseconds: 100),
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: _buttonPosition.dy + _buttonSize.height,
          left: _buttonPosition.dx,
          width: _buttonSize.width,
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                height: widget.links.length * _buttonSize.height,
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: _borderRadius,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(widget.links.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        widget.onChange(index);
                        closeMenu();
                      },
                      child: Container(
                        width: _buttonSize.width,
                        height: _buttonSize.height,
                        child: widget.links[index],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
