part of 'remote_article_bloc.dart';

abstract class RemoteArticleEvent {
  const RemoteArticleEvent();
}

class GetArticleEvent extends RemoteArticleEvent {
  const GetArticleEvent();
}
