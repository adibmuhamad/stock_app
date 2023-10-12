import 'package:dio/dio.dart';
import 'package:stock_app/core/constants/url.dart';
import 'package:stock_app/core/utils/dio_error_util.dart';
import 'package:stock_app/data/models/news_model.dart';

class NewsRemoteDataSource {
  final Dio _dio;

  NewsRemoteDataSource(this._dio);

  Future<NewsModel> fetchNews(String search, String page) async {
    try {
      final response = await _dio.get(Url.getNewsUrl,
          queryParameters: {"search": search, "page": page});

      NewsModel data = NewsModel.fromJson(response.data);
      if (data.meta?.code == 200) {
        return data;
      } else {
        throw Exception(data.meta?.message ?? '');
      }
    } on DioException catch (error) {
      throw Exception(DioErrorUtil.handleError(error));
    }
  }

  Future<NewsModel> fetchLatestNews(String page) async {
    try {
      final response = await _dio.get(Url.getStockNewsUrl,
          queryParameters: {"symbol": "DJI", "page": page});

      NewsModel data = NewsModel.fromJson(response.data);
      if (data.meta?.code == 200) {
        return data;
      } else {
        throw Exception(data.meta?.message ?? '');
      }
    } on DioException catch (error) {
      throw Exception(DioErrorUtil.handleError(error));
    }
  }

  Future<NewsModel> fetchIndicesNews(String page) async {
    try {
      final response = await _dio
          .get(Url.getIndicesNewsUrl, queryParameters: {"page": page});

      NewsModel data = NewsModel.fromJson(response.data);
      if (data.meta?.code == 200) {
        return data;
      } else {
        throw Exception(data.meta?.message ?? '');
      }
    } on DioException catch (error) {
      throw Exception(DioErrorUtil.handleError(error));
    }
  }

  Future<NewsModel> fetchGlobalsNews(String page) async {
    try {
      final response =
          await _dio.get(Url.getGlobalNewsUrl, queryParameters: {"page": page});

      NewsModel data = NewsModel.fromJson(response.data);
      if (data.meta?.code == 200) {
        return data;
      } else {
        throw Exception(data.meta?.message ?? '');
      }
    } on DioException catch (error) {
      throw Exception(DioErrorUtil.handleError(error));
    }
  }

  Future<NewsModel> fetchStockNews(String symbol, String page) async {
    try {
      final response = await _dio.get(Url.getStockNewsUrl,
          queryParameters: {"symbol": symbol, "page": page});

      NewsModel data = NewsModel.fromJson(response.data);
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
