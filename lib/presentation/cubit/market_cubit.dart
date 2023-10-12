import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/data/database/database.dart';
import 'package:stock_app/domain/entities/quote.dart';
import 'package:stock_app/domain/repositories/crypto_repository.dart';
import 'package:stock_app/domain/repositories/market_repository.dart';
import 'package:stock_app/domain/repositories/mutual_fund_repository.dart';
import 'package:stock_app/domain/repositories/stock_repository.dart';
import 'package:stock_app/thirdparty/candlestick/models/candle.dart';

part '../state/market_state.dart';

class MarketCubit extends Cubit<MarketState> {
  final MarketRepository _marketRepository;
  final StockRepository _stockRepository;
  final CryptoRepository _cryptoRepository;
  final MutualFundRepository _mutualFundRepository;

  Quote ihsgQuote = Quote();
  List<Candle> ihsgHistorical = [];
  List<Quote> indices = [];
  List<Quote> markets = [];
  List<SimpleStockData> simpleStocks = [];

  String interval = '1m';
  String timeframe = '1d';
  int indicesIndex = 0;
  int marketIndex = 0;

  MarketCubit(this._marketRepository, this._stockRepository,
      this._cryptoRepository, this._mutualFundRepository)
      : super(MarketInitial());

  Future<void> fetchSimpleStocks() async {
    try {
      emit(SimpleStocksLoading());
      var result = await _stockRepository.fetchSimpleStocks();
      result.fold(
        (error) => emit(SimpleStocksError(error)),
        (data) {
          simpleStocks = data;
          emit(SimpleStocksLoaded(data));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(SimpleStocksError(e.toString()));
    }
  }

  Future<void> fetchIhsgQuote() async {
    try {
      emit(IhsgQuoteLoading());
      var result = await _marketRepository.fetchIhsgQuote();
      result.fold(
        (error) => emit(IhsgQuoteError(error)),
        (data) {
          ihsgQuote = data;
          emit(IhsgQuoteLoaded(data));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(IhsgQuoteError(e.toString()));
    }
  }

  Future<void> fetchIhsgHistorical() async {
    try {
      ihsgHistorical = [];
      emit(IhsgHistoricalLoading());
      var result =
          await _marketRepository.fetchIhsgHistorical(interval, timeframe);
      result.fold(
        (error) => emit(IhsgHistoricalError(error)),
        (data) {
          ihsgHistorical = data;
          emit(IhsgHistoricalLoaded(data));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(IhsgHistoricalError(e.toString()));
    }
  }

  Future<void> fetchIndices() async {
    try {
      indices = [];
      emit(IndicesLoading());
      var result;
      switch (indicesIndex) {
        case 1:
          result = await _marketRepository.fetchLocalIndices();
          break;
        case 2:
          result = await _marketRepository.fetchCurrencies();
          break;
        case 3:
          result = await _marketRepository.fetchSectors();
          break;
        case 4:
          result = await _marketRepository.fetchCommodities();
          break;
        case 0:
        default:
          result = await _marketRepository.fetchGlobalIndices();
          break;
      }

      result.fold(
        (error) => emit(IndicesError(error)),
        (data) {
          indices = data;
          emit(IndicesLoaded(data));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(IndicesError(e.toString()));
    }
  }

  Future<void> fetchMarket() async {
    try {
      markets = [];
      emit(MarketLoading());
      var result;
      switch (marketIndex) {
        case 1:
          result = await _stockRepository.fetchTopStock();
          break;
        case 2:
          result = await _mutualFundRepository.fetchTopMutualFund();
          break;
        case 3:
          result = await _stockRepository.fetchTopUS();
          break;
        case 4:
          result = await _cryptoRepository.fetchTopCrypto();
          break;
        case 0:
        default:
          result = await _stockRepository.fetchTopLQ45();
          break;
      }

      result.fold(
        (error) => emit(MarketError(error)),
        (data) {
          markets = data;
          emit(MarketLoaded(data));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(MarketError(e.toString()));
    }
  }
}
