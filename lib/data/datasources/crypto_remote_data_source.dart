import 'package:dio/dio.dart';
import 'package:stock_app/core/constants/url.dart';
import 'package:stock_app/core/utils/dio_error_util.dart';
import 'package:stock_app/data/models/quotes_model.dart';

class CryptoRemoteDataSource {
  final Dio _dio;

  CryptoRemoteDataSource(this._dio);

  Future<QuotesModel> fetchTopCrypto() async {
    try {
      final response = await _dio.get(Url.getTopCryptoUrl);

      QuotesModel data = QuotesModel.fromJson(response.data);
      if (data.meta?.code == 200) {
        return data;
      } else {
        throw Exception(data.meta?.message ?? '');
      }
    } on DioException catch (error) {
      if (error.type != DioExceptionType.unknown) {
        throw Exception(DioErrorUtil.handleError(error));
      } else {
        rethrow; // Rethrow any other exceptions
      }
    }
  }

}
