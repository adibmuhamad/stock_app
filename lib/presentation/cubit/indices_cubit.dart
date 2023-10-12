import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/core/constants/enums.dart';
import 'package:stock_app/core/utils/chat_bot_util.dart';
import 'package:stock_app/core/utils/format_util.dart';
import 'package:stock_app/data/database/database.dart';
import 'package:stock_app/domain/entities/news.dart';
import 'package:stock_app/domain/entities/quote.dart';
import 'package:stock_app/domain/repositories/market_repository.dart';
import 'package:stock_app/domain/repositories/news_repository.dart';
import 'package:stock_app/env/env.dart';
import 'package:stock_app/thirdparty/candlestick/models/candle.dart';

part '../state/indices_state.dart';

class IndicesCubit extends Cubit<IndicesState> {
  final MarketRepository _marketRepository;
  final NewsRepository _newsRepository;

  Quote indexQuote = Quote();
  List<News> news = [];
  List<Candle> indexHistorical = [];
  int index = 0;
  String interval = '1m';
  String timeframe = '1d';
  String symbol = '';
  String name = '';
  MarketEnum? type;
  String trendAnalyze = '';

  int page = 0;

  IndicesCubit(this._marketRepository, this._newsRepository)
      : super(IndicesInitial());

  Future<void> fetchIndexQuote() async {
    try {
      emit(IndicesQuoteLoading());
      var result = await _marketRepository.fetchIndexQuote(symbol);
      result.fold(
        (error) => emit(IndicesQuoteError(error)),
        (data) {
          indexQuote = data;
          emit(IndicesQuoteLoaded(data));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(IndicesQuoteError(e.toString()));
    }
  }

  Future<void> fetchIndexHistorical() async {
    try {
      indexHistorical = [];
      emit(IndicesHistoricalLoading());
      var result = await _marketRepository.fetchIndexHistorical(
          symbol, interval, timeframe);
      result.fold(
        (error) => emit(IndicesHistoricalError(error)),
        (data) {
          indexHistorical = data;
          emit(IndicesHistoricalLoaded(data));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(IndicesHistoricalError(e.toString()));
    }
  }

  Future<void> getTrendAnalyze() async {
    try {
      trendAnalyze = '';
      emit(TrendAnalyzeLoading());
      final chatbot = ChatBotUtil(sessionId: Env.bardKey);
      ResponseData response = await chatbot.ask('Trend analyze $name today');
      trendAnalyze = response.answer;
      emit(TrendAnalyzeLoaded(trendAnalyze));
    } catch (e) {
      if (isClosed) return;
      emit(TrendAnalyzeError(e.toString()));
    }
  }

  Future<void> fetchIndexNews(bool isInit) async {
    try {
      if (isInit) {
        page = 0;
        news = [];
      }
      emit(IndicesNewsLoading());
      String temp = FormatUtil().getSymbol(symbol);
      var result = await _newsRepository.fetchNews(temp, page.toString());
      result.fold(
        (error) => emit(IndicesNewsError(error)),
        (data) {
          if (isInit) {
            news = data;
          } else {
            news.addAll(data);
          }
          emit(IndicesNewsLoaded(data));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(IndicesNewsError(e.toString()));
    }
  }
}
