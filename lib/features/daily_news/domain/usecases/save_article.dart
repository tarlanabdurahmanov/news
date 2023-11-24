import 'package:newsapp/features/daily_news/data/models/article_model.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/article.dart';
import '../repository/article_repository.dart';

class SaveArticleUseCase implements UseCase<void, ArtilceEntity> {
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArtilceEntity? params}) {
    return _articleRepository.saveArticle(params!);
  }
}
