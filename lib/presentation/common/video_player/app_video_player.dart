import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayer extends StatefulWidget {
  final AppVideoPlayerController controller;

  const AppVideoPlayer({required this.controller, Key? key}) : super(key: key);

  @override
  _AppVideoPlayerState createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  late final VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.network(widget.controller.url);
    _initializePlayer();
  }

  @override
  Widget build(BuildContext context) {
    if (_chewieController == null) {
      return Container();
    } else {
      return LayoutBuilder(builder: (context, constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxWidth / _videoPlayerController.value.aspectRatio,
            child: Chewie(controller: _chewieController!),
          ),
        );
      });
    }
  }

  void _initializePlayer() {
    _videoPlayerController.initialize().then(
      (_) {
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          showControlsOnInitialize: false,
          aspectRatio: 16 / 9,
        );
        widget.controller._onPauseListener = () {
          if (_chewieController?.isPlaying == true) {
            _chewieController?.pause();
          }
        };
        setState(() {});
      },
    );
  }
}

class AppVideoPlayerController {
  String url;
  VoidCallback? _onPauseListener;

  AppVideoPlayerController(this.url);

  void pause() {
    _onPauseListener?.call();
  }
}
