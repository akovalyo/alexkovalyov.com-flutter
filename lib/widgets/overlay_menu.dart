import 'package:flutter/material.dart';
import 'package:animated_icon_button/animated_icon_button.dart';

import 'package:mysite/consts/routes.dart';

class OverlayMenu extends StatefulWidget {
  final List links;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color? iconColor;
  final Color? buttonColor;
  final ValueChanged<int> onChange;

  const OverlayMenu({
    required this.links,
    required this.borderRadius,
    required this.backgroundColor,
    this.iconColor,
    this.buttonColor,
    required this.onChange,
  });
  @override
  _OverlayMenuState createState() => _OverlayMenuState();
}

class _OverlayMenuState extends State<OverlayMenu>
    with SingleTickerProviderStateMixin {
  late GlobalKey _key;
  bool _isMenuOpen = false;
  late Offset _buttonPosition;
  late Size _buttonSize;
  late OverlayEntry _overlayEntry;
  late BorderRadius _borderRadius;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      reverseDuration: Duration(milliseconds: 300),
    );
    _borderRadius = widget.borderRadius;
    _key = LabeledGlobalKey("button_icon");
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  findButton() {
    RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    _buttonSize = Size(60, 40);
    _buttonPosition = renderBox.localToGlobal(Offset(-20, 0));
  }

  void closeMenu() {
    _overlayEntry.remove();
    _isMenuOpen = !_isMenuOpen;
  }

  void openMenu() {
    findButton();
    _overlayEntry = _overlayEntryBuilder();
    navKey.currentState!.overlay!.insert(_overlayEntry);
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
        animationController: _animationController,
        onPressed: () {
          if (_isMenuOpen) {
            closeMenu();
          } else {
            openMenu();
          }
        },
        icons: [
          AnimatedIconItem(
            icon: Icon(
              Icons.more_vert,
            ),
          ),
          AnimatedIconItem(
            icon: Icon(
              Icons.close,
            ),
          ),
        ],
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
