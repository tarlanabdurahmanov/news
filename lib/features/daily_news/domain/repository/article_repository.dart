import '../../../../core/resources/data_state.dart';
import '../entities/article.dart';

abstract class ArticleRepository {
  // Api
  Future<DataState<List<ArtilceEntity>>> getNewsArticle();
  
  // Database
  Future<List<ArtilceEntity>> getSavedArticles();
  Future<void> saveArticle(ArtilceEntity article);
  Future<void> removeArticle(ArtilceEntity article);
}
