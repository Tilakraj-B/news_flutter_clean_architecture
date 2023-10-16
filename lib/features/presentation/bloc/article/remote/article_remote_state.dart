import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entity/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? article;
  final DioError? error;

  const RemoteArticleState({this.article, this.error});

  @override
  List<Object> get props => [article!, error!];
}

class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading();
}

class RemoteArticleDone extends RemoteArticleState {
  const RemoteArticleDone(List<ArticleEntity> article)
      : super(article: article);
}

class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError(DioError error) : super(error: error);
}
