import 'package:stock_app/env/env.dart';

class Url {
  Url._();

  static String baseUrl = Env.apiUrl;

  static String getSimpleStocksUrl = '$baseUrl/api/v1/stock';
  static String getIhsgQuoteUrl = '$baseUrl/api/v1/indices/ihsg';
  static String getIhsgHistoricalUrl = '$baseUrl/api/v1/indices/ihsg/chart';
  static String getIndexQuoteUrl = '$baseUrl/api/v1/indices';
  static String getIndexHistoricalUrl = '$baseUrl/api/v1/indices/chart';
  static String getGlobalIndicesUrl = '$baseUrl/api/v1/indices/global';
  static String getLocalIndicesUrl = '$baseUrl/api/v1/indices/local';
  static String getCurrenciesUrl = '$baseUrl/api/v1/currencies';
  static String getSectorsUrl = '$baseUrl/api/v1/sectors';
  static String getCommoditiesUrl = '$baseUrl/api/v1/commodities';
  static String getTopLq45Url = '$baseUrl/api/v1/stock/top/LQ45';
  static String getTopStockUrl = '$baseUrl/api/v1/stock/top';
  static String getTopUSUrl = '$baseUrl/api/v1/stock/top/us';
  static String getTopCryptoUrl = '$baseUrl/api/v1/market/top/crypto';
  static String getTopMutualFundUrl = '$baseUrl/api/v1/mutual-fund/top';
  static String getMutualFundUrl = '$baseUrl/api/v1/mutual-fund';
  static String getNewsUrl = '$baseUrl/api/v1/news';
  static String getIndicesNewsUrl = '$baseUrl/api/v1/news/indices';
  static String getStockNewsUrl = '$baseUrl/api/v1/news/stock';
  static String getGlobalNewsUrl = '$baseUrl/api/v1/news/global';
  static String getStockHistoricalUrl = '$baseUrl/api/v1/stock/chart';
  static String getStockQuoteUrl = '$baseUrl/api/v1/stock/quote';
  static String getStockRecommendationUrl = '$baseUrl/api/v1/stock/quote/recommendation';
  static String getStockOverviewUrl = '$baseUrl/api/v1/stock';

  static String getAllStocksUrl = '$baseUrl/api/v1/stock/all';
  static String getStockUrl = '$baseUrl/api/v1/stock/';
  static String getStockChartUrl = '$baseUrl/api/v1/stock/chart';
  static String getQuoteUrl = '$baseUrl/api/v1/stock/quote/';
}