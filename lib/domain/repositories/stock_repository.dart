import 'package:dartz/dartz.dart';
import 'package:stock_app/data/database/database.dart';
import 'package:stock_app/data/models/overview_model.dart';
import 'package:stock_app/domain/entities/quote.dart';
import 'package:stock_app/domain/entities/recommendation.dart';
import 'package:stock_app/thirdparty/candlestick/models/candle.dart';

abstract class StockRepository {
  Future<Either<String, List<SimpleStockData>>> fetchSimpleStocks();
  Future<Either<String, List<Quote>>> fetchTopLQ45();
  Future<Either<String, List<Quote>>> fetchTopStock();
  Future<Either<String, List<Quote>>> fetchTopUS();
  Future<Either<String, Quote>> fetchStockQuote(String symbol);
  Future<Either<String, List<Candle>>> fetchStockHistorical(String symbol, String interval, String timeframe);
  Future<Either<String, List<Recommendation>>> fetchStockRecommendation(String symbols);
  Future<Either<String, Data>> fetchStockOverview(String symbol);
}