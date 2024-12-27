import 'package:bloc_app_demo/features/daily_news/data/models/article.dart';
import 'package:floor/floor.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel articleModel);
  @delete
  Future<void> deleteArticle(ArticleModel articleModel);
  @Query('SELECT * FROM article')
  Future<List<ArticleModel>> getArticles();
}
