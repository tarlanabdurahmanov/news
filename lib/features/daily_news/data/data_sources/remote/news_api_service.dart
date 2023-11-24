import 'package:dio/dio.dart';

import '../../models/article_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/dio.dart';

import 'package:newsapp/core/constants/constants.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
