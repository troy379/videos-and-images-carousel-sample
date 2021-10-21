import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/get_it.dart';
import 'package:test_project/presentation/common/ui/images_carousel.dart';
import 'package:test_project/presentation/common/ui/loading_overlay.dart';
import 'package:test_project/presentation/common/ui/videos_carousel.dart';
import 'package:test_project/presentation/features/feed/feed_page_bloc.dart';
import 'package:test_project/presentation/features/feed/feed_page_state.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FeedPageBloc>(),
      child: BlocBuilder<FeedPageBloc, FeedPageState>(
        builder: (context, FeedPageState state) {
          return Scaffold(
            appBar: AppBar(title: const Text("Test Project")),
            body: Stack(
              children: [
                ListView(
                  children: [
                    VideosCarousel(videoUrls: state.feedContent?.topVideos ?? []),
                    const SizedBox(height: 12),
                    VideosCarousel(videoUrls: state.feedContent?.otherVideos ?? []),
                    const SizedBox(height: 12),
                    ImagesCarousel(
                      imageUrls: state.feedContent?.images ?? [],
                      omImageTap: _openImageInBrowser,
                    ),
                  ],
                ),
                if (state.isLoading) ...{
                  const LoadingOverlay(),
                }
              ],
            ),
          );
        },
      ),
    );
  }

  void _openImageInBrowser(String imageUrl) async {
    if (await canLaunch(imageUrl)) {
      await launch(imageUrl);
    }
  }
}
