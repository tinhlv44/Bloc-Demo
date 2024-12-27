import 'package:bloc_app_demo/features/daily_news/domain/usecases/get_save_article.dart';
import 'package:bloc_app_demo/features/daily_news/domain/usecases/remove_article.dart';
import 'package:bloc_app_demo/features/daily_news/domain/usecases/save_article.dart';
import 'package:bloc_app_demo/features/daily_news/presentation/bloc/article.dart/Local/Local_article_event.dart';
import 'package:bloc_app_demo/features/daily_news/presentation/bloc/article.dart/Local/Local_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSaveArticleUseCase _getSaveArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSaveArticleUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticleLoading()) {
    on<GetSaveArticles>(onGetSaveArticle); // Đúng sự kiện và handler
    on<SaveArticle>(onSaveArticle); // Đúng sự kiện và handler
    on<RemoveArticle>(onRemoveArticle); // Đúng sự kiện và handler
  }

  // Sửa hàm để nhận sự kiện và emitter
  void onGetSaveArticle(
      GetSaveArticles event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSaveArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void onRemoveArticle(
      RemoveArticle event, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: event.article);
    final articles = await _getSaveArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void onSaveArticle(SaveArticle event, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: event.article);
    final articles = await _getSaveArticleUseCase();
    emit(LocalArticleDone(articles));
  }
}
