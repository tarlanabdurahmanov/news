import 'package:floor/floor.dart';
import '../../../models/article_model.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel article);

  @Query("SELECT * FROM articles")
  Future<List<ArticleModel>> getArticles();
}
