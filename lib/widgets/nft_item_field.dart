import 'package:flutter/material.dart';

class NftItemField extends StatelessWidget {
  final dynamic leftChild;
  final dynamic rightChild;
  final bool bold;
  final Color? color;
  final MainAxisAlignment mainAxisAlignment;
  const NftItemField({
    Key? key,
    required this.leftChild,
    required this.rightChild,
    this.bold = false,
    this.color,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  }) : super(key: key);

  Widget flex(Widget child) {
    return Flexible(
      child: Container(child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        leftChild is String
            ? flex(
                Text(
                  leftChild,
                  style: TextStyle(
                    color: color,
                    fontWeight: bold ? FontWeight.bold : null,
                  ),
                ),
              )
            : flex(leftChild),
        rightChild is String
            ? flex(
                Text(
                  rightChild,
                  style: TextStyle(color: color),
                ),
              )
            : flex(rightChild),
      ],
    );
  }
}
