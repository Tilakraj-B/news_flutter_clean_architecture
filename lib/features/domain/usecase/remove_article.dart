import 'package:newsflutter/core/usecases/usecase.dart';
import 'package:newsflutter/features/domain/entity/article.dart';
import 'package:newsflutter/features/domain/repository/article_repository.dart';

class RemoveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.removeArticle(params!);
  }
}
