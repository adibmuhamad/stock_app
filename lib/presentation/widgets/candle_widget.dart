import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stock_app/core/constants/enums.dart';
import 'package:stock_app/core/constants/images.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';
import 'package:stock_app/core/utils/format_util.dart';
import 'package:stock_app/core/utils/navigation_util.dart';
import 'package:stock_app/injection_container.dart';
import 'package:stock_app/thirdparty/candlestick/candlesticks.dart';
import 'package:stock_app/thirdparty/candlestick/models/candle.dart';

class CandleWidget extends StatefulWidget {
  final String symbol;
  final String name;
  final MarketEnum? type;
  final ValueChanged<String> onInterval;
  final ValueChanged<String> onTimeframe;
  final bool isLoading;
  final List<Candle> candles;

  const CandleWidget({
    super.key,
    required this.onInterval,
    required this.onTimeframe,
    required this.candles,
    required this.isLoading,
    required this.symbol,
    required this.name,
    this.type,
  });

  @override
  State<CandleWidget> createState() => _CandleWidgetState();
}

class _CandleWidgetState extends State<CandleWidget> {
  List<String> interval = [
    '1m',
    '5m',
    '30m',
    '1h',
    '1d',
    '1wk',
    '1mo',
    '3mo',
  ];

  List<String> timeframe = [
    '1d',
    '5d',
    '1mo',
    '3mo',
    '6mo',
    '1y',
    '5y',
    '10y',
    'ytd',
    'max',
  ];

  int _selectedInterval = 0;
  int _selectedTimeframe = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 28,
          child: Row(
            children: [
              Expanded(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: List.generate(interval.length, (index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        _selectedInterval = index;
                        widget.onInterval.call(interval[index]);
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            interval[index].toUpperCase(),
                            style: _selectedInterval == index
                                ? Styles.regulerStyle.copyWith(
                                    fontSize: 14,
                                    color: Palletes.secondaryColor)
                                : Styles.lightStyle.copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              (widget.type != null)
                  ? GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => getIt<NavigationUtil>()
                          .navigateTo('TradingView', arguments: {
                        'symbol': FormatUtil().getSymbol(widget.symbol),
                        'name': widget.name,
                        'type': widget.type?.index
                      }),
                      child: SizedBox(
                        width: 24,
                        child: Image.asset(
                          Images.logoTradingView,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Palletes.whiteColor
                              : Palletes.blackColor,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 300,
          child: Candlesticks(
            candles: widget.candles,
            loadingWidget: (widget.isLoading)
                ? Shimmer.fromColors(
                    baseColor: Theme.of(context).brightness == Brightness.dark
                        ? Palletes.whiteColor
                        : Palletes.blackColor.withOpacity(.2),
                    highlightColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? Palletes.blackColor.withOpacity(.1)
                            : Palletes.whiteColor.withOpacity(.1),
                    child: Image.asset(
                      Images.chartShimmer,
                    ),
                  )
                : Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.oopsImg,
                        width: 60,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Palletes.whiteColor
                            : Palletes.blackColor,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'No historical found. Try other interval / time frame',
                        style: Styles.titleStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 28,
          child: ListView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: List.generate(timeframe.length, (index) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  _selectedTimeframe = index;
                  widget.onTimeframe.call(timeframe[index]);
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      timeframe[index].toUpperCase(),
                      style: _selectedTimeframe == index
                          ? Styles.regulerStyle.copyWith(
                              fontSize: 14, color: Palletes.secondaryColor)
                          : Styles.lightStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
