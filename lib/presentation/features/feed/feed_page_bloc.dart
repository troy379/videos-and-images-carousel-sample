import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/domain/usecases/load_feed_content_use_case.dart';
import 'package:test_project/presentation/features/feed/feed_page_state.dart';

class FeedPageBloc extends Cubit<FeedPageState> {
  final LoadContentDataUseCase loadContentDataUseCase;

  FeedPageBloc(this.loadContentDataUseCase) : super(FeedPageState.initial()) {
    loadContent();
  }

  void loadContent() async {
    emit(state.copyWith(isLoading: true));

    final feedContent = await loadContentDataUseCase.execute();

    emit(state.copyWith(isLoading: false, feedContent: feedContent));
  }
}
