import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/article.dart';
import '../repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArtilceEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArtilceEntity>>> call({void params}) {
    return _articleRepository.getNewsArticle();
  }
}
