import 'package:dartz/dartz.dart';
import 'package:stock_app/data/database/database.dart';
import 'package:stock_app/data/datasources/stock_local_data_source.dart';
import 'package:stock_app/data/datasources/stock_remote_data_source.dart';
import 'package:stock_app/data/models/overview_model.dart';
import 'package:stock_app/domain/entities/quote.dart';
import 'package:stock_app/domain/entities/recommendation.dart';
import 'package:stock_app/domain/repositories/stock_repository.dart';
import 'package:stock_app/thirdparty/candlestick/models/candle.dart';

class StockRepositoryImpl implements StockRepository {
  final StockRemoteDataSource _remoteDataSource;
  final StockLocalDataSource _localDataSource;

  StockRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<String, List<SimpleStockData>>> fetchSimpleStocks() async {
    try {
      List<SimpleStockData> stocks = [];
      var result = await _remoteDataSource.fetchSimpleStocks();
      result.data?.forEach(
        (data) {
          stocks.add(SimpleStockData(
            symbol: data.symbol ?? '',
            name: data.name ?? '',
          ));
        },
      );

      await _localDataSource.saveStocks(stocks);

      return Right(stocks);
    } catch (e) {
      var result = await _localDataSource.getStocks();
      if (result.isNotEmpty) {
        return Right(result);
      } else {
        return Left(e.toString());
      }
    }
  }

  @override
  Future<Either<String, List<Quote>>> fetchTopLQ45() async {
    try {
      List<Quote> quotes = [];
      var result = await _remoteDataSource.fetchTopLQ45();
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
  Future<Either<String, List<Quote>>> fetchTopStock() async {
    try {
      List<Quote> quotes = [];
      var result = await _remoteDataSource.fetchTopStock();
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
  Future<Either<String, List<Quote>>> fetchTopUS() async {
    try {
      List<Quote> quotes = [];
      var result = await _remoteDataSource.fetchTopUS();
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
  Future<Either<String, List<Candle>>> fetchStockHistorical(
      String symbol, String interval, String timeframe) async {
    try {
      List<Candle> historical = [];
      var result = await _remoteDataSource.fetchStockHistorical(
          symbol, interval, timeframe);

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
  Future<Either<String, Quote>> fetchStockQuote(String symbol) async {
    try {
      var result = await _remoteDataSource.fetchStockQuote(symbol);
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
  Future<Either<String, List<Recommendation>>> fetchStockRecommendation(String symbols) async {
    try {
      List<Recommendation> recommendations = [];
      var result = await _remoteDataSource.fetchStockRecommendation(symbols);

      result.data?.forEach(
        (data) {
          recommendations.add(Recommendation(
            symbol: data.symbol ?? '',
            recommendation: data.recommendation ?? '',
            description: data.description ?? '-',
            price : data.price ?? 0,
            buyingPrice :data.buying_price ?? 0,
            sellingPrice : data.selling_price ?? 0,
            stopLoss : data.stop_loss ?? 0,
            targetPrice : data.target_price ?? 0,
            predictedPrice : data.price ?? 0,
            date: data.time ?? '-',
          ));
        },
      );
      return Right(recommendations.toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Data>> fetchStockOverview(String symbol) async {
   try {
      var result = await _remoteDataSource.fetchStockOverview(symbol);
      return Right(result.data ?? const Data());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
