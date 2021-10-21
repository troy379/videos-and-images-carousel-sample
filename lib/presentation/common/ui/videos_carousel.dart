import 'package:flutter/material.dart';
import 'package:test_project/presentation/common/ui/carousel.dart';
import 'package:test_project/presentation/common/video_player/app_video_player.dart';

class VideosCarousel extends StatelessWidget {
  final List<AppVideoPlayerController> _videoPlayerControllers;

  VideosCarousel({required List<String> videoUrls, Key? key})
      : _videoPlayerControllers = videoUrls.map((url) => AppVideoPlayerController(url)).toList(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Carousel(
      itemCount: _videoPlayerControllers.length,
      offsetListener: (_) => _pauseAllPlayers(),
      pageBuilder: (index) {
        return Center(
          child: Card(
            elevation: 8,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: AppVideoPlayer(controller: _videoPlayerControllers[index]),
          ),
        );
      },
    );
  }

  void _pauseAllPlayers() {
    for (var controller in _videoPlayerControllers) {
      controller.pause();
    }
  }
}
