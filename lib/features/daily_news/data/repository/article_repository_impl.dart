import 'dart:io';

import 'package:bloc_app_demo/core/constants/constants.dart';
import 'package:bloc_app_demo/core/resources/data_state.dart';
import 'package:bloc_app_demo/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:bloc_app_demo/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:bloc_app_demo/features/daily_news/data/models/article.dart';
import 'package:bloc_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:bloc_app_demo/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newapiservice;
  final AppDatabase _appDatabase;
  ArticleRepositoryImpl(this._newapiservice, this._appDatabase);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newapiservice.getNewsArticles(
        apiKey: newsAPIKey,
        category: categoryQuery,
        country: countryQuery,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleEntities>> getSaveArticles() async {
    return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> removeArticles(ArticleEntities article) {
    return _appDatabase.articleDAO
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticles(ArticleEntities article) {
    return _appDatabase.articleDAO
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
