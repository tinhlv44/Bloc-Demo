import 'package:bloc_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntities>? articles;
  final DioException? error;

  const RemoteArticleState({this.articles, this.error});
  @override
  List<Object?> get props => [articles!, error!];
}

class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading();
}

class RemoteArticleDone extends RemoteArticleState {
  const RemoteArticleDone(List<ArticleEntities> articles)
      : super(articles: articles);
}

class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError(DioException error) : super(error: error);
}
