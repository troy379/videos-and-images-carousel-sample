import 'package:test_project/domain/models/feed_content.dart';
import 'package:test_project/domain/repositories/feed_repository.dart';

class FeedRepositoryImpl extends FeedRepository {
  @override
  Future<FeedContent> loadFeedContent() {
    return Future.delayed(const Duration(seconds: 1), () {
      return FeedContent(
        topVideos: [
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
        ],
        otherVideos: [
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
        ],
        images: [
          "https://images.unsplash.com/photo-1580757468214-c73f7062a5cb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8MTYlM0E5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
          "https://images.unsplash.com/photo-1580757468214-c73f7062a5cb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8MTYlM0E5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
        ],
      );
    });
  }
}
