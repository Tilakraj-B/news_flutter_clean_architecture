import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsflutter/core/resources/data_state.dart';
import 'package:newsflutter/features/presentation/bloc/article/remote/article_remote_event.dart';
import 'package:newsflutter/features/presentation/bloc/article/remote/article_remote_state.dart';

import '../../../../domain/usecase/get_article.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  Future<void> onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emitter) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(dataState.data!));
    }
    if (dataState is DataFailure) {
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
