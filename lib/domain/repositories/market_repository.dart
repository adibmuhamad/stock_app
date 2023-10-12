import 'package:dartz/dartz.dart';
import 'package:stock_app/domain/entities/quote.dart';
import 'package:stock_app/thirdparty/candlestick/models/candle.dart';

abstract class MarketRepository {
  Future<Either<String, Quote>> fetchIhsgQuote();
  Future<Either<String, List<Candle>>> fetchIhsgHistorical(String interval, String timeframe);
  Future<Either<String, Quote>> fetchIndexQuote(String symbol);
  Future<Either<String, List<Candle>>> fetchIndexHistorical(String symbol, String interval, String timeframe);
  Future<Either<String, List<Quote>>> fetchGlobalIndices();
  Future<Either<String, List<Quote>>> fetchLocalIndices();
  Future<Either<String, List<Quote>>> fetchCurrencies();
  Future<Either<String, List<Quote>>> fetchSectors();
  Future<Either<String, List<Quote>>> fetchCommodities();
}