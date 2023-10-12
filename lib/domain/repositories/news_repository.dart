import 'package:dartz/dartz.dart';
import 'package:stock_app/domain/entities/news.dart';

abstract class NewsRepository {
  Future<Either<String, List<News>>> fetchNews(String search, String page);
  Future<Either<String, List<News>>> fetchLatestNews(String page);
  Future<Either<String, List<News>>> fetchIndicesNews(String page);
  Future<Either<String, List<News>>> fetchStockNews(String symbol, String page);
  Future<Either<String, List<News>>> fetchGlobalNews(String page);
}