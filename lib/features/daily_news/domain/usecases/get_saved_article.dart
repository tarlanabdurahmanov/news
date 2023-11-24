import 'package:newsapp/features/daily_news/data/models/article_model.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/article.dart';
import '../repository/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArtilceEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArtilceEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
