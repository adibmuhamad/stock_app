part of '../cubit/market_cubit.dart';

abstract class MarketState {}

class MarketInitial extends MarketState {}

class SimpleStocksLoading extends MarketState {}

class SimpleStocksLoaded extends MarketState {
  final List<SimpleStockData> stocks;

  SimpleStocksLoaded(this.stocks);
}

class SimpleStocksError extends MarketState {
  final String error;

  SimpleStocksError(this.error);
}

class IhsgQuoteLoading extends MarketState {}

class IhsgQuoteLoaded extends MarketState {
  final Quote quote;

  IhsgQuoteLoaded(this.quote);
}

class IhsgQuoteError extends MarketState {
  final String error;

  IhsgQuoteError(this.error);
}

class IhsgHistoricalLoading extends MarketState {}

class IhsgHistoricalLoaded extends MarketState {
  final List<Candle> candle;

  IhsgHistoricalLoaded(this.candle);
}

class IhsgHistoricalError extends MarketState {
  final String error;

  IhsgHistoricalError(this.error);
}

class IndicesLoading extends MarketState {}

class IndicesLoaded extends MarketState {
  final List<Quote> quotes;

  IndicesLoaded(this.quotes);
}

class IndicesError extends MarketState {
  final String error;

  IndicesError(this.error);
}

class MarketLoading extends MarketState {}

class MarketLoaded extends MarketState {
  final List<Quote> quotes;

  MarketLoaded(this.quotes);
}

class MarketError extends MarketState {
  final String error;

  MarketError(this.error);
}