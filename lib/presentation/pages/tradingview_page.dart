import 'package:flutter/material.dart';
import 'package:stock_app/core/constants/enums.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';
import 'package:stock_app/presentation/widgets/tradingview_widget.dart';

class TradingviewPage extends StatefulWidget {
  final Map? data;
  const TradingviewPage({super.key, required this.data});

  @override
  State<TradingviewPage> createState() => _TradingviewPageState();
}

class _TradingviewPageState extends State<TradingviewPage> {
  String symbol = '';
  String name = '';
  MarketEnum type = MarketEnum.idx;

  @override
  void initState() {
    super.initState();

    if (widget.data != null) {
      symbol = widget.data!['symbol'] ?? '';
      name = widget.data!['name'] ?? '';
      type = MarketEnum.values[widget.data!['type'] ?? 0];
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height * 2;

    return Scaffold(
      appBar: TradingviewAppBarWidget(
        symbol: symbol,
        name: name,
      ),
      body: TradingviewWidget(
        height: height,
        symbol: getSymbol(symbol, type),
        theme:
            Theme.of(context).brightness == Brightness.dark ? "dark" : "light",
            type: TradingviewEnum.candle,
      ),
    );
  }

  
}

class TradingviewAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String symbol;
  final String name;

  const TradingviewAppBarWidget({
    super.key,
    required this.symbol,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Theme.of(context).brightness == Brightness.dark
            ? Palletes.whiteColor
            : Palletes.blackColor,
      ),
      title: Column(
        children: [
          Text(
            symbol,
            style: Styles.titleStyle.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: Styles.lightStyle.copyWith(fontSize: 11),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(50.0, 50.0);
}