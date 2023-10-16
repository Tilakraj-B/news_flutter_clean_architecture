import 'package:newsflutter/core/resources/data_state.dart';
import 'package:newsflutter/core/usecases/usecase.dart';
import 'package:newsflutter/features/domain/entity/article.dart';
import 'package:newsflutter/features/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
