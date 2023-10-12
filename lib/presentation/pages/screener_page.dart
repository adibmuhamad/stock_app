import 'package:flutter/material.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';
import 'package:stock_app/presentation/widgets/tradingview_widget.dart';

class ScreenerPage extends StatelessWidget {
  const ScreenerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(children: const [
          SizedBox(
            height: 50,
            child: TradingviewWidget(
              symbol: '',
              theme: '',
              type: TradingviewEnum.ticker,
            ),
          ),
          ScreenerWidget(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(color: Palletes.greyColor),
          ),
          ForexWidget(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(color: Palletes.greyColor),
          ),
          CalendarEconomyWidget(),
        ]),
      ),
    );
  }
}

class ScreenerWidget extends StatelessWidget {
  const ScreenerWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Screener',
          style: Styles.titleStyle.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 16),
        const SizedBox(
          height: 250,
          child: TradingviewWidget(
            symbol: '',
            theme: '',
            type: TradingviewEnum.screener,
          ),
        ),
      ],
    );
  }
}

class ForexWidget extends StatelessWidget {
  const ForexWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Forex Cross Rates',
          style: Styles.titleStyle.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 16),
        const SizedBox(
          height: 200,
          child: TradingviewWidget(
            symbol: '',
            theme: '',
            type: TradingviewEnum.forex,
          ),
        ),
      ],
    );
  }
}

class CalendarEconomyWidget extends StatelessWidget {
  const CalendarEconomyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Calendar Economy',
          style: Styles.titleStyle.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 16),
        const SizedBox(
          height: 400,
          child: TradingviewWidget(
            symbol: '',
            theme: '',
            type: TradingviewEnum.calendar,
          ),
        ),
      ],
    );
  }
}
