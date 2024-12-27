import 'package:bloc_app_demo/core/resources/data_state.dart';
import 'package:bloc_app_demo/core/usecases/usecases.dart';
import 'package:bloc_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:bloc_app_demo/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements Usecases<DataState<List<ArticleEntities>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntities>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
