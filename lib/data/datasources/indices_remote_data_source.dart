import 'package:dio/dio.dart';
import 'package:stock_app/core/constants/url.dart';
import 'package:stock_app/core/utils/dio_error_util.dart';
import 'package:stock_app/data/models/historical_model.dart';
import 'package:stock_app/data/models/quote_model.dart';
import 'package:stock_app/data/models/quotes_model.dart';

class IndicesRemoteDataSource {
  final Dio _dio;

  IndicesRemoteDataSource(this._dio);

  Future<QuoteModel> fetchIhsgQuote() async {
    try {
      final response = await _dio.get(Url.getIhsgQuoteUrl);
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

  Future<HistoricalModel> fetchIhsgHistorical(
      String interval, String timeframe) async {
    try {
      final response =
          await _dio.get(Url.getIhsgHistoricalUrl, queryParameters: {
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

  Future<QuoteModel> fetchIndexQuote( String symbol) async {
    try {
      final response = await _dio.get('${Url.getIndexQuoteUrl}/$symbol');
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

  Future<HistoricalModel> fetchIndexHistorical(
      String symbol, String interval, String timeframe) async {
    try {
      final response =
          await _dio.get(Url.getIndexHistoricalUrl, queryParameters: {
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


  Future<QuotesModel> fetchGlobalIndices() async {
    try {
      final response = await _dio.get(Url.getGlobalIndicesUrl);

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

  Future<QuotesModel> fetchLocalIndices() async {
    try {
      final response = await _dio.get(Url.getLocalIndicesUrl);

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

   Future<QuotesModel> fetchCurrencies() async {
    try {
      final response = await _dio.get(Url.getCurrenciesUrl);

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

   Future<QuotesModel> fetchSectors() async {
    try {
      final response = await _dio.get(Url.getSectorsUrl);

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

  Future<QuotesModel> fetchCommodities() async {
    try {
      final response = await _dio.get(Url.getCommoditiesUrl);

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
}
