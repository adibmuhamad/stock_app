import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/domain/entities/news.dart';
import 'package:stock_app/domain/repositories/news_repository.dart';

part '../state/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository _newsRepository;

  List<News> news = [];

  int page = 0;
  int index = 0;

  NewsCubit(this._newsRepository) : super(NewsInitial());

  Future<void> fetchLatestNews(bool isInit) async {
    try {
      if (isInit) {
        page = 0;
        news = [];
      }

      emit(NewsLoading());
      var result = await _newsRepository.fetchLatestNews(page.toString());
      result.fold(
        (error) => emit(NewsError(error)),
        (data) {
          if (isInit) {
            news = data;
          } else {
            news.addAll(data);
          }

          emit(NewsLoaded(news));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(NewsError(e.toString()));
    }
  }

  Future<void> fetchIndicesNews(bool isInit) async {
    try {
      if (isInit) {
        page = 0;
        news = [];
      }

      emit(NewsLoading());
      var result = await _newsRepository.fetchIndicesNews(page.toString());
      result.fold(
        (error) => emit(NewsError(error)),
        (data) {
          news = data;
          // if (isInit) {
          //   news = data;
          // } else {
          //   news.addAll(data);
          // }

          emit(NewsLoaded(news));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(NewsError(e.toString()));
    }
  }

  Future<void> fetchGlobalNews(bool isInit) async {
    try {
      if (isInit) {
        page = 0;
        news = [];
      }

      emit(NewsLoading());
      var result = await _newsRepository.fetchGlobalNews(page.toString());
      result.fold(
        (error) => emit(NewsError(error)),
        (data) {
          news = data;
          // if (isInit) {
          //   news = data;
          // } else {
          //   news.addAll(data);
          // }

          emit(NewsLoaded(news));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(NewsError(e.toString()));
    }
  }
}
