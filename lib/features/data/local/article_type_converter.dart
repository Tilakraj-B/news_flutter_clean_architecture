import 'package:floor/floor.dart';
import 'package:newsflutter/features/data/models/article.dart';

class ArticleTypeConverter extends TypeConverter<ArticleModel?, String> {
  @override
  ArticleModel? decode(String databaseValue) {
    final List<String> results = databaseValue.split(',');
    return ArticleModel(
        title: results[1],
        content: results[2],
        description: results[3],
        publishedAt: results[4],
        url: results[5],
        urlToImage: results[6]);
  }

  @override
  String encode(ArticleModel? value) {
    final String result =
        '${value?.id}, ${value?.title},${value?.content}, ${value?.description}, ${value?.publishedAt}, ${value?.url}, ${value?.urlToImage}';
    return result;
  }
}
