import 'package:dartz/dartz.dart';
import 'package:stock_app/data/datasources/indices_remote_data_source.dart';
import 'package:stock_app/domain/entities/quote.dart';
import 'package:stock_app/domain/repositories/market_repository.dart';
import 'package:stock_app/thirdparty/candlestick/models/candle.dart';

class MarketRepositoryImpl implements MarketRepository {
  final IndicesRemoteDataSource _dataSource;

  MarketRepositoryImpl(this._dataSource);
  @override
  Future<Either<String, Quote>> fetchIhsgQuote() async {
    try {
      var result = await _dataSource.fetchIhsgQuote();
      return Right(Quote(
        symbol: result.data?.symbol ?? '',
        name: result.data?.name ?? '',
        open: result.data?.open ?? 0,
        high: result.data?.high ?? 0,
        low: result.data?.low ?? 0,
        close: result.data?.close ?? 0,
        prevClose: result.data?.prev_close ?? 0,
        change: result.data?.change ?? 0,
        changePercent: result.data?.change_percent ?? 0,
        lastUpdated: result.data?.time ?? '-',
        volume: result.data?.volume ?? 0,
      ));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Candle>>> fetchIhsgHistorical(
      String interval, String timeframe) async {
    try {
      List<Candle> historical = [];
      var result = await _dataSource.fetchIhsgHistorical(interval, timeframe);
      result.data?.forEach(
        (data) {
          if ((data.open ?? 0) > 0) {
            historical.add(Candle(
              open: data.open ?? 0,
              high: data.high ?? 0,
              low: data.low ?? 0,
              close: data.close ?? 0,
              volume: data.volume ?? 0,
              date: DateTime.fromMillisecondsSinceEpoch(
                  (data.timestamp ?? 0) * 1000),
            ));
          }
        },
      );
      return Right(historical.reversed.toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Quote>>> fetchGlobalIndices() async {
    try {
      List<Quote> quotes = [];
      var result = await _dataSource.fetchGlobalIndices();
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

  @override
  Future<Either<String, List<Quote>>> fetchLocalIndices() async {
    try {
      List<Quote> quotes = [];
      var result = await _dataSource.fetchLocalIndices();
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

  @override
  Future<Either<String, List<Quote>>> fetchCurrencies() async {
    try {
      List<Quote> quotes = [];
      var result = await _dataSource.fetchCurrencies();
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

  @override
  Future<Either<String, List<Quote>>> fetchSectors() async {
    try {
      List<Quote> quotes = [];
      var result = await _dataSource.fetchSectors();
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

  @override
  Future<Either<String, List<Quote>>> fetchCommodities() async {
    try {
      List<Quote> quotes = [];
      var result = await _dataSource.fetchCommodities();
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

  @override
  Future<Either<String, List<Candle>>> fetchIndexHistorical(
      String symbol, String interval, String timeframe) async {
    try {
      List<Candle> historical = [];
      var result =
          await _dataSource.fetchIndexHistorical(symbol, interval, timeframe);
      result.data?.forEach(
        (data) {
          if ((data.open ?? 0) > 0) {
            historical.add(Candle(
              open: data.open ?? 0,
              high: data.high ?? 0,
              low: data.low ?? 0,
              close: data.close ?? 0,
              volume: data.volume ?? 0,
              date: DateTime.fromMillisecondsSinceEpoch(
                  (data.timestamp ?? 0) * 1000),
            ));
          }
        },
      );
      return Right(historical.reversed.toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Quote>> fetchIndexQuote(String symbol) async {
    try {
      var result = await _dataSource.fetchIndexQuote(symbol);
      return Right(Quote(
        symbol: result.data?.symbol ?? '',
        name: result.data?.name ?? '',
        open: result.data?.open ?? 0,
        high: result.data?.high ?? 0,
        low: result.data?.low ?? 0,
        close: result.data?.close ?? 0,
        prevClose: result.data?.prev_close ?? 0,
        change: result.data?.change ?? 0,
        changePercent: result.data?.change_percent ?? 0,
        lastUpdated: result.data?.time ?? '-',
        volume: result.data?.volume ?? 0,
      ));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
