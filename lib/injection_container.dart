import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newsflutter/features/data/local/app_database.dart';
import 'package:newsflutter/features/data/remote/news_api_service.dart';
import 'package:newsflutter/features/data/repository/article_repository_impl.dart';
import 'package:newsflutter/features/domain/repository/article_repository.dart';
import 'package:newsflutter/features/domain/usecase/get_article.dart';
import 'package:newsflutter/features/domain/usecase/get_saved_article.dart';
import 'package:newsflutter/features/domain/usecase/remove_article.dart';
import 'package:newsflutter/features/domain/usecase/save_article.dart';
import 'package:newsflutter/features/presentation/bloc/article/local/article_local_bloc.dart';
import 'package:newsflutter/features/presentation/bloc/article/remote/article_remote_bloc.dart';

final s1 = GetIt.instance;

Future<void> initalizeDependencies() async {
  final databse =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  s1.registerSingleton<AppDatabase>(databse);
  s1.registerSingleton<Dio>(Dio());

  s1.registerSingleton<NewsApiService>(NewsApiService(s1()));

  s1.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(s1(), s1()));

  s1.registerSingleton<GetArticleUseCase>(GetArticleUseCase(s1()));

  s1.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(s1()));

  s1.registerSingleton(GetSavedArticleUseCase(s1()));
  s1.registerSingleton(RemoveArticleUseCase(s1()));
  s1.registerSingleton(SaveArticleUseCase(s1()));

  s1.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(s1(), s1(), s1()));
}
