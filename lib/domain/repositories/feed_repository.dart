import 'package:test_project/domain/models/feed_content.dart';

abstract class FeedRepository {
  Future<FeedContent> loadFeedContent();
}