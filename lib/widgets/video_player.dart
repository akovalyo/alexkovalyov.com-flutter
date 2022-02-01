import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:universal_html/html.dart';

class VideoPlayer extends StatefulWidget {
  final String path;
  final id;
  final int width;
  final int height;
  const VideoPlayer({
    Key? key,
    required this.path,
    required this.id,
    this.width = 200,
    this.height = 200,
  }) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  void initState() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        widget.id,
        (int viewId) => VideoElement()
          ..src = widget.path
          ..width = widget.width
          ..height = widget.height
          ..style.height = '100%'
          ..style.width = '100%'
          ..loop = true
          ..autoplay = true
          ..controls = true
          ..style.border = 'none');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width as double,
      height: widget.height as double,
      child: HtmlElementView(
        viewType: widget.id,
      ),
    );
  }
}
