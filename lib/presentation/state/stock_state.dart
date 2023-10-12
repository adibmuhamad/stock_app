part of '../cubit/stock_cubit.dart';

abstract class StockState {}

class StockInitial extends StockState {}

class StockLoading extends StockState {}

class StockLoaded extends StockState {
  final List<Stock> stockData;

  StockLoaded(this.stockData);
}

class StockError extends StockState {}

class StockQuoteLoading extends StockState {}

class StockQuoteLoaded extends StockState {
  final Quote quote;

  StockQuoteLoaded(this.quote);
}

class StockQuoteError extends StockState {
  final String error;

  StockQuoteError(this.error);
}

class StockHistoricalLoading extends StockState {}

class StockHistoricalLoaded extends StockState {
  final List<Candle> candle;

  StockHistoricalLoaded(this.candle);
}

class StockHistoricalError extends StockState {
  final String error;

  StockHistoricalError(this.error);
}

class StockRecommendationLoading extends StockState {}

class StockRecommendationLoaded extends StockState {
  final List<Recommendation> recommendation;

  StockRecommendationLoaded(this.recommendation);
}

class StockRecommendationError extends StockState {
  final String error;

  StockRecommendationError(this.error);
}

class TrendAnalyzeLoading extends StockState {}

class TrendAnalyzeLoaded extends StockState {
  final String anlyze;

  TrendAnalyzeLoaded(this.anlyze);
}

class TrendAnalyzeError extends StockState {
  final String error;

  TrendAnalyzeError(this.error);
}

class StockOverviewLoading extends StockState {}

class StockOverviewLoaded extends StockState {
  final Data data;

  StockOverviewLoaded(this.data);
}

class StockOverviewError extends StockState {
  final String error;

  StockOverviewError(this.error);
}

class StockNewsLoading extends StockState {}

class StockNewsLoaded extends StockState {
  final List<News> news;

  StockNewsLoaded(this.news);
}

class StockNewsError extends StockState {
  final String error;

  StockNewsError(this.error);
}