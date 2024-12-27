import 'package:bloc_app_demo/core/resources/data_state.dart';
import 'package:bloc_app_demo/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  //Api method
  Future<DataState<List<ArticleEntities>>> getNewsArticles();

  // db method
  Future<List<ArticleEntities>> getSaveArticles();
  Future<void> saveArticles(ArticleEntities entity);
  Future<void> removeArticles(ArticleEntities entity);
}
