import 'package:bloc_app_demo/core/constants/constants.dart';
import 'package:bloc_app_demo/features/daily_news/data/models/article.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart'; // Phần này cần để Retrofit tự động sinh mã nguồn

@RestApi(baseUrl: newsAPIBaseURL) // Base URL từ constants.dart
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
