import 'package:newsflutter/core/usecases/usecase.dart';
import 'package:newsflutter/features/domain/entity/article.dart';
import 'package:newsflutter/features/domain/repository/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticle();
  }
}
