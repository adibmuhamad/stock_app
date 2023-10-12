import 'package:dio/dio.dart';
import 'package:stock_app/core/constants/url.dart';
import 'package:stock_app/core/utils/dio_error_util.dart';
import 'package:stock_app/data/models/historical_model.dart';
import 'package:stock_app/data/models/overview_model.dart';
import 'package:stock_app/data/models/quote_model.dart';
import 'package:stock_app/data/models/quotes_model.dart';
import 'package:stock_app/data/models/recommendation_model.dart';
import 'package:stock_app/data/models/simple_stocks_model.dart';

class StockRemoteDataSource {
  final Dio _dio;

  StockRemoteDataSource(this._dio);

  Future<SimpleStocksModel> fetchSimpleStocks() async {
    try {
      final response = await _dio.get(Url.getSimpleStocksUrl);

      SimpleStocksModel data = SimpleStocksModel.fromJson(response.data);
      if (data.meta?.code == 200) {
        return data;
      } else {
        throw Exception(data.meta?.message ?? '');
      }
    } on DioException catch (error) {
      throw Exception(DioErrorUtil.handleError(error));
    }
  }

  Future<QuotesModel> fetchTopLQ45() async {
    try {
      final response = await _dio.get(Url.getTopLq45Url);

      QuotesModel data = QuotesModel.fromJson(response.data);
      if (data.meta?.code == 200) {
        return data;
      } else {
        throw Exception(data.meta?.message ?? '');
      }
    } on DioException catch (error) {
      throw Exception(DioErrorUtil.handleError(error));
    }
  }

  Future<QuotesModel> fetchTopStock() async {
    try {
      final response = await _dio.get(Url.getTopStockUrl);

      QuotesModel data = QuotesModel.fromJson(response.data);
      if (data.meta?.code == 200) {
        return data;
      } else {
        throw Exception(data.meta?.message ?? '');
      }
    } on DioException catch (error) {
      throw Exception(DioErrorUtil.handleError(error));
    }
  }

  Future<QuotesModel> fetchTopUS() async {
    try {
      final response = await _dio.get(Url.getTopUSUrl);

      QuotesModel data = QuotesModel.fromJson(response.data);
      if (data.meta?.code == 200) {
        return data;
      } else {
        throw Exception(data.meta?.message ?? '');
      }
    } on DioException catch (error) {
      throw Exception(DioErrorUtil.handleError(error));
    }
  }

  Future<QuoteModel> fetchStockQuote(String symbol) async {
    try {
      final response = await _dio.get('${Url.getStockQuoteUrl}/$symbol');
      QuoteModel data = QuoteModel.fromJson(response.data);
      if (data.meta?.code == 200) {
        return data;
      } else {
        throw Exception(data.meta?.message ?? '');
      }
    } on DioException catch (error) {
      throw Exception(DioErrorUtil.handleError(error));
    }
  }

  Future<HistoricalModel> fetchStockHistorical(
      String symbol, String interval, String timeframe) async {
    try {
      final response =
          await _dio.get(Url.getStockHistoricalUrl, queryParameters: {
        "symbol": symbol,
        "interval": interval,
        "timeframe": timeframe,
      });

      HistoricalModel data = HistoricalModel.fromJson(response.data);
      if (data.meta?.code == 200) {
        return data;
      } else {
        throw Exception(data.meta?.message ?? '');
      }
    } on DioException catch (error) {
      throw Exception(DioErrorUtil.handleError(error));
    }
  }

  Future<RecommendationModel> fetchStockRecommendation(String symbols) async {
    try {
      final response = await _dio.get(Url.getStockRecommendationUrl,
          queryParameters: {"symbols": symbols});

      RecommendationModel data = RecommendationModel.fromJson(response.data);
      if (data.meta?.code == 200) {
        return data;
      } else {
        throw Exception(data.meta?.message ?? '');
      }
    } on DioException catch (error) {
      throw Exception(DioErrorUtil.handleError(error));
    }
  }

  Future<OverviewModel> fetchStockOverview(String symbol) async {
    try {
      final response = await _dio.get('${Url.getStockOverviewUrl}/$symbol');

      OverviewModel data = OverviewModel.fromJson(response.data);
      if (data.meta?.code == 200) {
        return data;
      } else {
        throw Exception(data.meta?.message ?? '');
      }
    } on DioException catch (error) {
      throw Exception(DioErrorUtil.handleError(error));
    }
  }
}
