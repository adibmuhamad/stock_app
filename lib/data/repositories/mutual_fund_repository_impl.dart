import 'package:dartz/dartz.dart';
import 'package:stock_app/data/datasources/mutual_fund_remote_data_source.dart';
import 'package:stock_app/data/models/mutual_fund_model.dart';
import 'package:stock_app/domain/entities/quote.dart';
import 'package:stock_app/domain/repositories/mutual_fund_repository.dart';

class MutualFundRepositoryImpl implements MutualFundRepository {
  final MutualFundRemoteDataSource _dataSource;

  MutualFundRepositoryImpl(this._dataSource);

  @override
  Future<Either<String, List<Quote>>> fetchTopMutualFund() async {
    try {
      List<Quote> quotes = [];
      var result = await _dataSource.fetchTopMutualFund();
      result.data?.forEach(
        (data) {
          quotes.add(Quote(
            id: data.id,
            symbol: data.symbol ?? '',
            name: data.name ?? '',
            open: data.open ?? 0,
            high: data.high ?? 0,
            low: data.low ?? 0,
            close: data.close ?? 0,
            prevClose: data.prev_close ?? 0,
            change: data.change ?? 0,
            changePercent: data.change_percent ?? 0,
            lastUpdated: data.time ?? '-',
            volume: data.volume ?? 0,
          ));
        },
      );
      return Right(quotes);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Data>> fetchMutualFund(String symbol) async {
    try {
      var result = await _dataSource.fetchMutualFund(symbol);
      return Right(result.data ?? const Data());
    } catch (e) {
      return Left(e.toString());
    }
  }
}