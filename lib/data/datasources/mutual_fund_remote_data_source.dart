import 'package:dio/dio.dart';
import 'package:stock_app/core/constants/url.dart';
import 'package:stock_app/core/utils/dio_error_util.dart';
import 'package:stock_app/data/models/mutual_fund_model.dart';
import 'package:stock_app/data/models/quotes_model.dart';

class MutualFundRemoteDataSource {
  final Dio _dio;

  MutualFundRemoteDataSource(this._dio);

  Future<QuotesModel> fetchTopMutualFund() async {
    try {
      final response = await _dio.get(Url.getTopMutualFundUrl);

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

  Future<MutualFundModel> fetchMutualFund(String symbol) async {
    try {
      final response = await _dio.get('${Url.getMutualFundUrl}/$symbol');

      MutualFundModel data = MutualFundModel.fromJson(response.data);
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
