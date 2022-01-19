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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        leftChild is String
            ? Text(
                leftChild,
                style: TextStyle(
                  color: color,
                  fontWeight: bold ? FontWeight.bold : null,
                ),
              )
            : leftChild,
        rightChild is String
            ? Text(
                rightChild,
                style: TextStyle(color: color),
              )
            : rightChild,
      ],
    );
  }
}
