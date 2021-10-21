import 'package:test_project/domain/models/feed_content.dart';

class FeedPageState {
  final FeedContent? feedContent;
  final bool isLoading;

  FeedPageState({required this.feedContent, required this.isLoading});

  FeedPageState.initial() : this(feedContent: null, isLoading: true);

  FeedPageState copyWith({
    FeedContent? feedContent,
    bool? isLoading,
  }) {
    return FeedPageState(
      feedContent: feedContent ?? this.feedContent,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
