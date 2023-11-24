part of 'local_article_bloc.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArtilceEntity? article;

  const LocalArticleEvent({this.article});

  @override
  List<Object> get props => [article!];
}

class GetSavedArticles extends LocalArticleEvent {
  const GetSavedArticles();
}

class RemoveArticle extends LocalArticleEvent {
  const RemoveArticle(ArtilceEntity article) : super(article: article);
}

class SaveArticle extends LocalArticleEvent {
  const SaveArticle(ArtilceEntity article) : super(article: article);
}
