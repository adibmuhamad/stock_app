import 'package:dartz/dartz.dart';
import 'package:stock_app/data/datasources/crypto_remote_data_source.dart';
import 'package:stock_app/domain/entities/quote.dart';
import 'package:stock_app/domain/repositories/crypto_repository.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  final CryptoRemoteDataSource _dataSource;

  CryptoRepositoryImpl(this._dataSource);

  @override
  Future<Either<String, List<Quote>>> fetchTopCrypto() async {
    try {
      List<Quote> quotes = [];
      var result = await _dataSource.fetchTopCrypto();
      result.data?.forEach(
        (data) {
          quotes.add(Quote(
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
}
