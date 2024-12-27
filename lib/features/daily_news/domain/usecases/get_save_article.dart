import 'package:bloc_app_demo/core/usecases/usecases.dart';
import 'package:bloc_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:bloc_app_demo/features/daily_news/domain/repository/article_repository.dart';

class GetSaveArticleUseCase implements Usecases<List<ArticleEntities>, void> {
  final ArticleRepository _articleRepository;

  GetSaveArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntities>> call({void params}) {
    return _articleRepository.getSaveArticles();
  }
}
