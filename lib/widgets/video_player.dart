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
      width: 200,
      height: 200,
      child: HtmlElementView(
        viewType: widget.id,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:universal_html/html.dart';
// import 'video_player/';
// import 'package:video_player_web/video_player_web.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   final String path;
//   const VideoPlayerScreen({Key? key, required this.path}) : super(key: key);

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     VideoPlayerController _controller = widget.path.startsWith('http')
//         ? VideoPlayerController.network(
//             widget.path,
//           )
//         : VideoPlayerController.asset(widget.path);

//     _initializeVideoPlayerFuture = _controller.initialize();
//     _controller.setLooping(true);

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _initializeVideoPlayerFuture,
//       builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           );
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }
