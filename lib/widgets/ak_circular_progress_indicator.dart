import 'package:flutter/material.dart';

class AkCircularProgressIndicator extends StatelessWidget {
  final double? value;

  const AkCircularProgressIndicator({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: value,
      valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).colorScheme.secondary),
    );
  }
}
