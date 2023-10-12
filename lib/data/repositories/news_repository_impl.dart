import 'package:dartz/dartz.dart';
import 'package:stock_app/data/datasources/news_remote_data_source.dart';
import 'package:stock_app/domain/entities/news.dart';
import 'package:stock_app/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource _remoteDataSource;

  NewsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<String, List<News>>> fetchLatestNews(String page) async {
    try {
      List<News> news = [];
      var result = await _remoteDataSource.fetchLatestNews(page);
      result.data?.forEach(
        (data) {
          news.add(News(
            date: data.date ?? '',
            category: data.category ?? '',
            title: data.title ?? '',
            description: data.description ?? '',
            link: data.link ?? '',
          ));
        },
      );
      return Right(news);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<News>>> fetchIndicesNews(String page) async {
    try {
      List<News> news = [];
      var result = await _remoteDataSource.fetchIndicesNews(page);
      result.data?.forEach(
        (data) {
          news.add(News(
            date: data.date ?? '',
            category: data.category ?? '',
            title: data.title ?? '',
            description: data.description ?? '',
            link: data.link ?? '',
          ));
        },
      );
      return Right(news);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<News>>> fetchStockNews(
      String symbol, String page) async {
    try {
      List<News> news = [];
      var result = await _remoteDataSource.fetchStockNews(symbol, page);
      result.data?.forEach(
        (data) {
          news.add(News(
            date: data.date ?? '',
            category: data.category ?? '',
            title: data.title ?? '',
            description: data.description ?? '',
            link: data.link ?? '',
          ));
        },
      );
      return Right(news);
    } catch (e) {
      return Left(e.toString());
    }
  }
  
  @override
  Future<Either<String, List<News>>> fetchGlobalNews(String page) async {
    try {
      List<News> news = [];
      var result = await _remoteDataSource.fetchGlobalsNews(page);
      result.data?.forEach(
        (data) {
          news.add(News(
            date: data.date ?? '',
            category: data.category ?? '',
            title: data.title ?? '',
            description: data.description ?? '',
            link: data.link ?? '',
          ));
        },
      );
      return Right(news);
    } catch (e) {
      return Left(e.toString());
    }
  }
  
  @override
  Future<Either<String, List<News>>> fetchNews(String search, String page) async {
    try {
      List<News> news = [];
      var result = await _remoteDataSource.fetchNews(search, page);
      result.data?.forEach(
        (data) {
          news.add(News(
            date: data.date ?? '',
            category: data.category ?? '',
            title: data.title ?? '',
            description: data.description ?? '',
            link: data.link ?? '',
          ));
        },
      );
      return Right(news);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
