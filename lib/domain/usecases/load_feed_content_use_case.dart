import 'package:test_project/domain/models/feed_content.dart';
import 'package:test_project/domain/repositories/feed_repository.dart';

class LoadContentDataUseCase {
  final FeedRepository _feedRepository;

  LoadContentDataUseCase(this._feedRepository);

  Future<FeedContent> execute() async {
    return _feedRepository.loadFeedContent();
  }
}
