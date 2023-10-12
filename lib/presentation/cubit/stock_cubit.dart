import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/core/utils/chat_bot_util.dart';
import 'package:stock_app/core/utils/format_util.dart';
import 'package:stock_app/data/database/database.dart';
import 'package:stock_app/data/models/overview_model.dart';
import 'package:stock_app/domain/entities/news.dart';
import 'package:stock_app/domain/entities/quote.dart';
import 'package:stock_app/domain/entities/recommendation.dart';
import 'package:stock_app/domain/entities/stock.dart';
import 'package:stock_app/domain/repositories/news_repository.dart';
import 'package:stock_app/domain/repositories/stock_repository.dart';
import 'package:stock_app/env/env.dart';
import 'package:stock_app/thirdparty/candlestick/models/candle.dart';

part '../state/stock_state.dart';

class StockCubit extends Cubit<StockState> {
  final StockRepository _stockRepository;
  final NewsRepository _newsRepository;

  Quote stockQuote = Quote();
  Data stockOverview = const Data();
  List<News> news = [];
  List<Candle> stockHistorical = [];
  Recommendation stockRecommendation = Recommendation();
  int index = 0;
  String interval = '1m';
  String timeframe = '1d';
  String symbol = '';
  String name = '';
  String trendAnalyze = '';

  int page = 0;

  StockCubit(this._stockRepository, this._newsRepository)
      : super(StockInitial());

  Future<void> fetchStockQuote() async {
    try {
      emit(StockQuoteLoading());
      var result = await _stockRepository.fetchStockQuote(symbol);
      result.fold(
        (error) => emit(StockQuoteError(error)),
        (data) {
          stockQuote = data;
          emit(StockQuoteLoaded(data));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(StockQuoteError(e.toString()));
    }
  }

  Future<void> fetchStockHistorical() async {
    try {
      stockHistorical = [];
      emit(StockHistoricalLoading());
      var result = await _stockRepository.fetchStockHistorical(
          symbol, interval, timeframe);
      result.fold(
        (error) => emit(StockHistoricalError(error)),
        (data) {
          stockHistorical = data;
          emit(StockHistoricalLoaded(data));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(StockHistoricalError(e.toString()));
    }
  }

  Future<void> fetchStockRecommendation() async {
    try {
      emit(StockRecommendationLoading());
      var result = await _stockRepository.fetchStockRecommendation(symbol);
      result.fold(
        (error) => emit(StockRecommendationError(error)),
        (data) {
          if (data.isNotEmpty) {
            stockRecommendation = data[0];
          }
          emit(StockRecommendationLoaded(data));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(StockRecommendationError(e.toString()));
    }
  }

  Future<void> getTrendAnalyze() async {
    try {
       trendAnalyze = '';
      emit(TrendAnalyzeLoading());
      final chatbot = ChatBotUtil(sessionId: Env.bardKey);
      ResponseData response = await chatbot
          .ask('Trend analyze ${FormatUtil().getSymbol(symbol)} today');
      trendAnalyze = response.answer;
      emit(TrendAnalyzeLoaded(trendAnalyze));
    } catch (e) {
      if (isClosed) return;
      emit(TrendAnalyzeError(e.toString()));
    }
  }

  Future<void> fetchStockOverview() async {
    try {
      emit(StockOverviewLoading());
      var result = await _stockRepository.fetchStockOverview(symbol);
      result.fold(
        (error) => emit(StockOverviewError(error)),
        (data) {
          stockOverview = data;
          emit(StockOverviewLoaded(data));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(StockOverviewError(e.toString()));
    }
  }

  Future<void> fetchStockNews(bool isInit) async {
    try {
      if (isInit) {
        page = 0;
        news = [];
      }
      emit(StockNewsLoading());
      String temp = FormatUtil().getSymbol(symbol);
      var result = await _newsRepository.fetchStockNews(temp, page.toString());
      result.fold(
        (error) => emit(StockNewsError(error)),
        (data) {
          if (isInit) {
            news = data;
          } else {
            news.addAll(data);
          }
          emit(StockNewsLoaded(data));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(StockNewsError(e.toString()));
    }
  }
}
