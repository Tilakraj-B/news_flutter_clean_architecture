import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsflutter/features/domain/usecase/get_saved_article.dart';
import 'package:newsflutter/features/domain/usecase/remove_article.dart';
import 'package:newsflutter/features/domain/usecase/save_article.dart';
import 'package:newsflutter/features/presentation/bloc/article/local/article_local_event.dart';
import 'package:newsflutter/features/presentation/bloc/article/local/article_local_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvents, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(this._getSavedArticleUseCase, this._saveArticleUseCase,
      this._removeArticleUseCase)
      : super(const LocalArticlesLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<SaveArticle>(onSaveArticle);
    on<RemoveArticle>(onRemoveArticle);
  }

  void onGetSavedArticles(GetSavedArticles getSavedArticles,
      Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticle(
      RemoveArticle removeArticle, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: removeArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(
      SaveArticle saveArticle, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: saveArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone((articles)));
  }
}
