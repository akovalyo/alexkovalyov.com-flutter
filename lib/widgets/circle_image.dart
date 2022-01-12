import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double imageRadius;
  final double borderRadius;
  final ImageProvider imageProvider;

  const CircleImage(
      {Key? key,
      this.imageRadius = 20,
      required this.imageProvider,
      this.borderRadius = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      radius: imageRadius + borderRadius,
      child: CircleAvatar(
        radius: imageRadius,
        backgroundImage: imageProvider,
      ),
    );
  }
}
