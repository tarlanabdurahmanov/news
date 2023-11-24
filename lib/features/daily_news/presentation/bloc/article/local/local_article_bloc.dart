import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/features/daily_news/domain/entities/article.dart';
import 'package:newsapp/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:newsapp/features/daily_news/domain/usecases/remove_article.dart';
import 'package:newsapp/features/daily_news/domain/usecases/save_article.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticleLoadingState()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSaveArticle);
  }

  void onGetSavedArticles(
      GetSavedArticles event, Emitter<LocalArticleState> emit) async {
    emit(const LocalArticleLoadingState());
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDoneState(articles));
  }

  void onRemoveArticle(
      RemoveArticle removeArticle, Emitter<LocalArticleState> emit) async {
    emit(const LocalArticleLoadingState());
    await _removeArticleUseCase(params: removeArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDoneState(articles));
  }

  void onSaveArticle(
      SaveArticle saveArticle, Emitter<LocalArticleState> emit) async {
    emit(const LocalArticleLoadingState());

    final articles = await _getSavedArticleUseCase();
    for (var element in articles) {
      if (element.title == saveArticle.article?.title) {
        onRemoveArticle(RemoveArticle(element), emit);
      } else {
        await _saveArticleUseCase(params: saveArticle.article);
      }
    }
    emit(LocalArticleDoneState(articles));
  }
}
