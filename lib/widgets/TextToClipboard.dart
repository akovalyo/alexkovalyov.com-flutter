import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextToClipboard extends StatelessWidget {
  final String textToCopy;
  final String? description;
  const TextToClipboard({
    Key? key,
    required this.textToCopy,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String snackbarText =
        description != null ? '$description copied!' : 'Copied!';
    return InkWell(
      mouseCursor: SystemMouseCursors.copy,
      onTap: () =>
          Clipboard.setData(ClipboardData(text: textToCopy)).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(snackbarText),
            backgroundColor: Colors.green[600]!.withOpacity(0.7),
          ),
        );
      }),
      child: Tooltip(
        message: textToCopy,
        child: Container(
          width: 100,
          child: Text(
            textToCopy,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
