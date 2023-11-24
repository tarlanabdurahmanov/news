part of 'local_article_bloc.dart';

abstract class LocalArticleState extends Equatable {
  final List<ArtilceEntity>? articles;

  const LocalArticleState({this.articles});

  @override
  List<Object> get props => [articles!];
}

class LocalArticleLoadingState extends LocalArticleState {
  const LocalArticleLoadingState();
}

class LocalArticleDoneState extends LocalArticleState {
  const LocalArticleDoneState(List<ArtilceEntity> articles)
      : super(articles: articles);
}
