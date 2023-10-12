import 'package:flutter/material.dart';
import 'package:stock_app/core/constants/enums.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/utils/format_util.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum TradingviewEnum {
  candle,
  technicalAnalyze,
  market,
  calendar,
  ticker,
  screener,
  forex,
  financial,
}

String getSymbol(String symbol, MarketEnum type) {
  String temp = FormatUtil().getSymbol(symbol);
  switch (type) {
    case MarketEnum.idx:
      return 'IDX:$temp';
    case MarketEnum.nasdaq:
      return 'NASDAQ:$temp';
    case MarketEnum.crypto:
      return 'CRYPTO:$temp';
  }
}

class TradingviewWidget extends StatefulWidget {
  final String symbol;
  final double? height;
  final String theme;
  final TradingviewEnum type;

  const TradingviewWidget({
    super.key,
    this.height,
    required this.symbol,
    required this.theme,
    required this.type,
  });

  @override
  State<TradingviewWidget> createState() => _TradingviewWidgetState();
}

class _TradingviewWidgetState extends State<TradingviewWidget> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(
          widget.theme == 'dark' ? Palletes.blackColor : Palletes.whiteColor)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
        ),
      )
      ..enableZoom(true)
      ..loadHtmlString(widget.type == TradingviewEnum.technicalAnalyze
          ? technicalAnalyzeSource(widget.symbol, widget.theme)
          : widget.type == TradingviewEnum.market
              ? marketSource(widget.theme)
              : widget.type == TradingviewEnum.screener
                  ? screenerSource(widget.theme)
                  : widget.type == TradingviewEnum.calendar
                      ? calendarSource(widget.theme)
                      : widget.type == TradingviewEnum.forex
                          ? forexSource(widget.theme)
                          : widget.type == TradingviewEnum.ticker
                              ? tickerSource(widget.theme)
                              : widget.type == TradingviewEnum.financial
                                  ? financialSource(widget.symbol, widget.theme)
                                  : candleSource(widget.symbol, widget.height!,
                                      widget.theme));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragUpdate: (updateDetails) {},
        child: WebViewWidget(controller: controller));
  }

  static String candleSource(String symbol, double height, String theme) {
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body>
<div class="tradingview-widget-container">
  <div id="tradingview_30e86"></div>
  <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
  <script type="text/javascript">
  new TradingView.widget(
  {
  "width": "100%",
  "height": $height,
  "symbol": '$symbol',
  "interval": "D",
  "timezone": "Etc/UTC",
 "theme": "$theme",
  "style": "0",
  "locale": "en",
  "toolbar_bg": "#f1f3f6",
  "enable_publishing": false,
  "withdateranges": true,
  "hide_side_toolbar": false,
  "save_image": false,
  "container_id": "tradingview_30e86"
}
  );
  </script>
</div>
</body>
</html>''';
  }

  static String technicalAnalyzeSource(String symbol, String theme) {
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body>
<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container">
  <div class="tradingview-widget-container__widget"></div>
  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-technical-analysis.js" async>
  {
  "interval": "1m",
  "width": "100%",
  "isTransparent": true,
  "height": "450",
  "symbol": "$symbol",
  "showIntervalTabs": true,
  "locale": "en",
  "colorTheme": "$theme"
}
  </script>
</div>
<!-- TradingView Widget END -->
</body>
</html>''';
  }

  static String marketSource(String theme) {
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body>
<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container">
  <div class="tradingview-widget-container__widget"></div>
  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-hotlists.js" async>
  {
  "colorTheme": "light",
  "dateRange": "12M",
  "exchange": "IDX",
  "showChart": true,
  "locale": "en",
  "largeChartUrl": "",
  "isTransparent": false,
  "showSymbolLogo": false,
  "showFloatingTooltip": false,
  "width": "100%",
  "height": "600",
  "plotLineColorGrowing": "rgba(41, 98, 255, 1)",
  "plotLineColorFalling": "rgba(41, 98, 255, 1)",
  "gridLineColor": "rgba(240, 243, 250, 0)",
  "scaleFontColor": "rgba(106, 109, 120, 1)",
  "belowLineFillColorGrowing": "rgba(41, 98, 255, 0.12)",
  "belowLineFillColorFalling": "rgba(41, 98, 255, 0.12)",
  "belowLineFillColorGrowingBottom": "rgba(41, 98, 255, 0)",
  "belowLineFillColorFallingBottom": "rgba(41, 98, 255, 0)",
  "symbolActiveColor": "rgba(41, 98, 255, 0.12)"
}
  </script>
</div>
<!-- TradingView Widget END -->
</body>
</html>''';
  }

  static String calendarSource(String theme) {
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body>
<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container">
  <div class="tradingview-widget-container__widget"></div>
  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-events.js" async>
  {
  "width": "100%",
  "height": "800",
  "colorTheme": "light",
  "isTransparent": false,
  "locale": "en",
  "importanceFilter": "-1,0,1",
  "currencyFilter": "IDR"
}
  </script>
</div>
<!-- TradingView Widget END -->
</body>
</html>''';
  }

  static String tickerSource(String theme) {
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body>
<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container">
  <div class="tradingview-widget-container__widget"></div>
  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-ticker-tape.js" async>
  {
  "symbols": [
    {
      "description": "IHSG",
      "proName": "IDX:COMPOSITE"
    },
    {
      "description": "NASDAQ",
      "proName": "NASDAQ:IXIC"
    },
    {
      "description": "USD/IDR",
      "proName": "FX_IDC:USDIDR"
    },
    {
      "description": "BTC/USD",
      "proName": "BITSTAMP:BTCUSD"
    },
    {
      "description": "LQ45",
      "proName": "IDX:LQ45"
    }
  ],
  "showSymbolLogo": true,
  "colorTheme": "light",
  "isTransparent": false,
  "displayMode": "adaptive",
  "locale": "en"
}
  </script>
</div>
<!-- TradingView Widget END -->
</body>
</html>''';
  }

  static String screenerSource(String theme) {
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body>
<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container">
  <div class="tradingview-widget-container__widget"></div>
  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-screener.js" async>
  {
  "width": "1100",
  "height": "523",
  "defaultColumn": "overview",
  "defaultScreen": "most_capitalized",
  "market": "indonesia",
  "showToolbar": true,
  "colorTheme": "light",
  "locale": "en"
}
  </script>
</div>
<!-- TradingView Widget END -->
</body>
</html>''';
  }

  static String forexSource(String theme) {
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body>
<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container">
  <div class="tradingview-widget-container__widget"></div>
  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-forex-cross-rates.js" async>
  {
  "width": "100%",
  "height": 400,
  "currencies": [
    "EUR",
    "USD",
    "JPY",
    "GBP",
    "CHF",
    "AUD",
    "CAD",
    "NZD",
    "IDR"
  ],
  "isTransparent": false,
  "colorTheme": "light",
  "locale": "en"
}
  </script>
</div>
<!-- TradingView Widget END -->
</body>
</html>''';
  }

  static String financialSource(String symbol, String theme) {
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body>
<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container">
  <div class="tradingview-widget-container__widget"></div>
  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-financials.js" async>
  {
  "colorTheme": "light",
  "isTransparent": false,
  "largeChartUrl": "",
  "displayMode": "regular",
  "width": "100%",
  "height": 830,
  "symbol": '$symbol',
  "locale": "en"
}
  </script>
</div>
<!-- TradingView Widget END -->
</body>
</html>''';
  }
}
