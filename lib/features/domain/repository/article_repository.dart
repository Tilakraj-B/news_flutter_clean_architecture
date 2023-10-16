import 'package:newsflutter/features/data/models/article.dart';

import '../../../core/resources/data_state.dart';
import '../entity/article.dart';

abstract class ArticleRepository {
  // API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // Database methods

  Future<List<ArticleModel>> getSavedArticle();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}
