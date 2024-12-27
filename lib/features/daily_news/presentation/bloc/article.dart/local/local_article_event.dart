import 'package:bloc_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntities? article;

  const LocalArticleEvent({this.article});
  @override
  List<Object?> get props => [article];
}

class GetSaveArticles extends LocalArticleEvent {
  const GetSaveArticles();
}

class RemoveArticle extends LocalArticleEvent {
  const RemoveArticle(ArticleEntities article) : super(article: article);
}

class SaveArticle extends LocalArticleEvent {
  const SaveArticle(ArticleEntities article) : super(article: article);
}
