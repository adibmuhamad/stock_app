part of '../cubit/indices_cubit.dart';

abstract class IndicesState {}

class IndicesInitial extends IndicesState {}

class IndicesLoading extends IndicesState {}

class IndicesQuoteLoading extends IndicesState {}

class IndicesQuoteLoaded extends IndicesState {
  final Quote quote;

  IndicesQuoteLoaded(this.quote);
}

class IndicesQuoteError extends IndicesState {
  final String error;

  IndicesQuoteError(this.error);
}

class IndicesHistoricalLoading extends IndicesState {}

class IndicesHistoricalLoaded extends IndicesState {
  final List<Candle> candle;

  IndicesHistoricalLoaded(this.candle);
}

class IndicesHistoricalError extends IndicesState {
  final String error;

  IndicesHistoricalError(this.error);
}

class TrendAnalyzeLoading extends IndicesState {}

class TrendAnalyzeLoaded extends IndicesState {
  final String anlyze;

  TrendAnalyzeLoaded(this.anlyze);
}

class TrendAnalyzeError extends IndicesState {
  final String error;

  TrendAnalyzeError(this.error);
}

class IndicesNewsLoading extends IndicesState {}

class IndicesNewsLoaded extends IndicesState {
  final List<News> news;

  IndicesNewsLoaded(this.news);
}

class IndicesNewsError extends IndicesState {
  final String error;

  IndicesNewsError(this.error);
}