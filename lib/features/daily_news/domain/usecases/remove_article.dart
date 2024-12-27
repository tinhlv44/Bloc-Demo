import 'package:bloc_app_demo/core/usecases/usecases.dart';
import 'package:bloc_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:bloc_app_demo/features/daily_news/domain/repository/article_repository.dart';

class RemoveArticleUseCase implements Usecases<void, ArticleEntities> {
  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntities? params}) {
    return _articleRepository.removeArticles(params!);
  }
}
