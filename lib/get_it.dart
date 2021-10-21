import 'package:get_it/get_it.dart';
import 'package:test_project/data/repositories/feed_repository_impl.dart';
import 'package:test_project/domain/repositories/feed_repository.dart';
import 'package:test_project/domain/usecases/load_feed_content_use_case.dart';
import 'package:test_project/presentation/features/feed/feed_page_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // BLoCs
  getIt.registerFactory<FeedPageBloc>(() => FeedPageBloc(getIt<LoadContentDataUseCase>()));

  // Repositories
  getIt.registerLazySingleton<FeedRepository>(() => FeedRepositoryImpl());

  // Use cases
  getIt.registerLazySingleton<LoadContentDataUseCase>(() => LoadContentDataUseCase(getIt<FeedRepository>()));
}
