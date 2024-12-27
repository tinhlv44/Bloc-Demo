import 'package:bloc_app_demo/core/resources/data_state.dart';
import 'package:bloc_app_demo/features/daily_news/domain/usecases/get_article.dart';
import 'package:bloc_app_demo/features/daily_news/presentation/bloc/article.dart/remote/remote_article_event.dart';
import 'package:bloc_app_demo/features/daily_news/presentation/bloc/article.dart/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticle);
  }
  void onGetArticle(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      //print(dataState.data!.toString());
      emit(RemoteArticleDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
