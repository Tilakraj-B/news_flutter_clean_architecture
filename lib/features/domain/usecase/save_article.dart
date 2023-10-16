import 'package:newsflutter/core/usecases/usecase.dart';
import 'package:newsflutter/features/domain/entity/article.dart';
import 'package:newsflutter/features/domain/repository/article_repository.dart';

class SaveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.saveArticle(params!);
  }
}
