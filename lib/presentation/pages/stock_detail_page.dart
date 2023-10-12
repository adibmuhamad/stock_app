import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stock_app/core/constants/app_icons.dart';
import 'package:stock_app/core/constants/enums.dart';
import 'package:stock_app/core/constants/images.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';
import 'package:stock_app/core/utils/date_util.dart';
import 'package:stock_app/core/utils/format_util.dart';
import 'package:stock_app/core/utils/number_format_util.dart';
import 'package:stock_app/presentation/cubit/stock_cubit.dart';
import 'package:stock_app/presentation/pages/news_page.dart';
import 'package:stock_app/presentation/widgets/candle_widget.dart';
import 'package:stock_app/presentation/widgets/error_load_widget.dart';
import 'package:stock_app/presentation/widgets/quote_widget.dart';
import 'package:stock_app/presentation/widgets/skelton_widget.dart';
import 'package:stock_app/presentation/widgets/tradingview_widget.dart';

class StockDetailPage extends StatefulWidget {
  final Map? data;
  const StockDetailPage({super.key, this.data});

  @override
  State<StockDetailPage> createState() => _StockDetailPageState();
}

class _StockDetailPageState extends State<StockDetailPage> {
  late StockCubit _stockCubit;

  void onLoad() {
    _stockCubit.fetchStockQuote();
    _stockCubit.fetchStockHistorical();
    _stockCubit.fetchStockRecommendation();
    _stockCubit.getTrendAnalyze();
    _stockCubit.fetchStockOverview();
    _stockCubit.fetchStockNews(true);
  }

  @override
  void initState() {
    _stockCubit = context.read<StockCubit>();

    if (widget.data != null) {
      _stockCubit.symbol = widget.data!['symbol'] ?? '';
      _stockCubit.name = widget.data!['name'] ?? '';

      onLoad();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: StockDetailAppBarWidget(
            symbol: _stockCubit.symbol, name: _stockCubit.name),
        body: TabBarView(children: [
          TrendWidget(
            symbol: _stockCubit.symbol,
            name: _stockCubit.name,
            cubit: _stockCubit,
            onRefresh: () => onLoad(),
          ),
          FinancialWidget(
            cubit: _stockCubit,
            onRefresh: () => onLoad(),
          ),
          CorporateActionWidget(
            cubit: _stockCubit,
            onRefresh: () => onLoad(),
          ),
          NewsStockWidget(
            cubit: _stockCubit,
            onRefresh: () => onLoad(),
          ),
          OverviewWidget(
            cubit: _stockCubit,
            onRefresh: () => onLoad(),
          ),
        ]),
      ),
    );
  }
}

class FinancialWidget extends StatelessWidget {
  final StockCubit cubit;
  final VoidCallback onRefresh;

  const FinancialWidget(
      {super.key, required this.cubit, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController =
        RefreshController(initialRefresh: false);

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocConsumer<StockCubit, StockState>(
          bloc: cubit,
          listener: (context, state) {},
          buildWhen: (previous, current) {
            return current is StockOverviewLoading ||
                current is StockOverviewLoaded ||
                current is StockOverviewError;
          },
          builder: (context, state) {
            if (state is StockOverviewLoading) {
              return Column(
                children: List.generate(10, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SkeltonWidget(width: size.width),
                  );
                }),
              );
            }
            if (state is StockOverviewError) {
              return ErrorLoadWidget(
                onReload: () => cubit.fetchStockOverview(),
              );
            }

            return SmartRefresher(
              controller: refreshController,
              enablePullDown: true,
              enablePullUp: false,
              header: const MaterialClassicHeader(),
              onRefresh: () {
                onRefresh.call();
                refreshController.refreshCompleted();
              },
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: ClampingScrollPhysics()),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Value",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              NumberFormatUtil.formatCompact(
                                  cubit.stockOverview.last_data?.value ?? 0,
                                  decimalDigits: 2),
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Volume",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              NumberFormatUtil.formatCompact(
                                  cubit.stockOverview.last_data?.volume ?? 0,
                                  decimalDigits: 2),
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Frequency",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              NumberFormatUtil.formatCompact(
                                  cubit.stockOverview.last_data?.frequency ?? 0,
                                  decimalDigits: 2),
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Market Cap",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              NumberFormatUtil.formatCompact(
                                  cubit.stockOverview.last_data?.market_cap ??
                                      0,
                                  decimalDigits: 2),
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Divider(color: Palletes.greyColor),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "PER",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              NumberFormatUtil.formatDecimal(
                                  cubit.stockOverview.last_data?.per ?? 0,
                                  decimalDigits: 2),
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "PBR",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              NumberFormatUtil.formatDecimal(
                                  cubit.stockOverview.last_data?.pbr ?? 0,
                                  decimalDigits: 2),
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Divider(color: Palletes.greyColor),
                      const SizedBox(height: 8),
                      Text(
                        "Annual",
                        style: Styles.regulerStyle.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Annual High Price",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              NumberFormatUtil.formatDecimal(
                                  cubit.stockOverview.last_data
                                          ?.annual_high_price ??
                                      0,
                                  decimalDigits: 0),
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Annual Low Price",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              NumberFormatUtil.formatDecimal(
                                  cubit.stockOverview.last_data
                                          ?.annual_low_price ??
                                      0,
                                  decimalDigits: 0),
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Divider(color: Palletes.greyColor),
                      const SizedBox(height: 8),
                      Text(
                        "Return",
                        style: Styles.regulerStyle.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "One Day",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              NumberFormatUtil.formatChange(
                                  cubit.stockOverview.last_data?.one_day ?? 0,
                                  decimalDigits: 2),
                              style: Styles.regulerStyle.copyWith(
                                  fontSize: 14,
                                  color:
                                      (cubit.stockOverview.last_data?.one_day ??
                                                  0) >
                                              0
                                          ? Palletes.bullishColor
                                          : (cubit.stockOverview.last_data
                                                          ?.one_day ??
                                                      0) <
                                                  0
                                              ? Palletes.bearishColor
                                              : null),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "One Week",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              NumberFormatUtil.formatChange(
                                  cubit.stockOverview.last_data?.one_week ?? 0,
                                  decimalDigits: 2),
                              style: Styles.regulerStyle.copyWith(
                                  fontSize: 14,
                                  color: (cubit.stockOverview.last_data
                                                  ?.one_week ??
                                              0) >
                                          0
                                      ? Palletes.bullishColor
                                      : (cubit.stockOverview.last_data
                                                      ?.one_week ??
                                                  0) <
                                              0
                                          ? Palletes.bearishColor
                                          : null),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "One Month",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              NumberFormatUtil.formatChange(
                                  cubit.stockOverview.last_data?.one_month ?? 0,
                                  decimalDigits: 2),
                              style: Styles.regulerStyle.copyWith(
                                  fontSize: 14,
                                  color: (cubit.stockOverview.last_data
                                                  ?.one_month ??
                                              0) >
                                          0
                                      ? Palletes.bullishColor
                                      : (cubit.stockOverview.last_data
                                                      ?.one_month ??
                                                  0) <
                                              0
                                          ? Palletes.bearishColor
                                          : null),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Six Months",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              NumberFormatUtil.formatChange(
                                  cubit.stockOverview.last_data?.six_month ?? 0,
                                  decimalDigits: 2),
                              style: Styles.regulerStyle.copyWith(
                                  fontSize: 14,
                                  color: (cubit.stockOverview.last_data
                                                  ?.six_month ??
                                              0) >
                                          0
                                      ? Palletes.bullishColor
                                      : (cubit.stockOverview.last_data
                                                      ?.six_month ??
                                                  0) <
                                              0
                                          ? Palletes.bearishColor
                                          : null),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "One Year",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              NumberFormatUtil.formatChange(
                                  cubit.stockOverview.last_data?.one_year ?? 0,
                                  decimalDigits: 2),
                              style: Styles.regulerStyle.copyWith(
                                  fontSize: 14,
                                  color: (cubit.stockOverview.last_data
                                                  ?.one_year ??
                                              0) >
                                          0
                                      ? Palletes.bullishColor
                                      : (cubit.stockOverview.last_data
                                                      ?.one_year ??
                                                  0) <
                                              0
                                          ? Palletes.bearishColor
                                          : null),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Five Years",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              NumberFormatUtil.formatChange(
                                  cubit.stockOverview.last_data?.five_year ?? 0,
                                  decimalDigits: 2),
                              style: Styles.regulerStyle.copyWith(
                                  fontSize: 14,
                                  color: (cubit.stockOverview.last_data
                                                  ?.five_year ??
                                              0) >
                                          0
                                      ? Palletes.bullishColor
                                      : (cubit.stockOverview.last_data
                                                      ?.five_year ??
                                                  0) <
                                              0
                                          ? Palletes.bearishColor
                                          : null),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "YTD",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              NumberFormatUtil.formatChange(
                                  cubit.stockOverview.last_data?.ytd ?? 0,
                                  decimalDigits: 2),
                              style: Styles.regulerStyle.copyWith(
                                  fontSize: 14,
                                  color: (cubit.stockOverview.last_data?.ytd ??
                                              0) >
                                          0
                                      ? Palletes.bullishColor
                                      : (cubit.stockOverview.last_data?.ytd ??
                                                  0) <
                                              0
                                          ? Palletes.bearishColor
                                          : null),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Last Updated",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              DateUtil.convertToString(
                                  cubit.stockOverview.last_data?.time ??
                                      DateTime.now()),
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class CorporateActionWidget extends StatelessWidget {
  final StockCubit cubit;
  final VoidCallback onRefresh;

  const CorporateActionWidget(
      {super.key, required this.cubit, required this.onRefresh});
  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController =
        RefreshController(initialRefresh: false);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocConsumer<StockCubit, StockState>(
          bloc: cubit,
          listener: (context, state) {},
          buildWhen: (previous, current) {
            return current is StockOverviewLoading ||
                current is StockOverviewLoaded ||
                current is StockOverviewError;
          },
          builder: (context, state) {
            if (state is StockOverviewLoading) {
              return Column(
                children: List.generate(10, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SkeltonWidget(width: size.width),
                  );
                }),
              );
            }
            if (state is StockOverviewError) {
              return ErrorLoadWidget(
                onReload: () => cubit.fetchStockOverview(),
              );
            }
            return SmartRefresher(
              controller: refreshController,
              enablePullDown: true,
              enablePullUp: false,
              header: const MaterialClassicHeader(),
              onRefresh: () {
                onRefresh.call();
                refreshController.refreshCompleted();
              },
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: ClampingScrollPhysics()),
                itemCount: (cubit.stockOverview.corporate_actions ?? []).length,
                itemBuilder: (BuildContext context, int index) {
                  String type =
                      cubit.stockOverview.corporate_actions?[index].type ?? '';
                  String date = DateUtil.convertToString(
                      cubit.stockOverview.corporate_actions?[index].date ??
                          DateTime.now());
                  String total = NumberFormatUtil.formatCompact(cubit
                          .stockOverview
                          .corporate_actions?[index]
                          .total_corporate_action ??
                      0);
                  String value = NumberFormatUtil.formatCompact(cubit
                          .stockOverview
                          .corporate_actions?[index]
                          .total_value ??
                      0);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        type.toUpperCase(),
                        style: Styles.titleStyle.copyWith(
                            fontSize: 16, color: Palletes.secondaryColor),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            type,
                            style: Styles.lightStyle.copyWith(fontSize: 14),
                          ),
                          Text(
                            total,
                            style: Styles.regulerStyle.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Value',
                            style: Styles.lightStyle.copyWith(fontSize: 14),
                          ),
                          Text(
                            value,
                            style: Styles.regulerStyle.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date',
                            style: Styles.lightStyle.copyWith(fontSize: 14),
                          ),
                          Text(
                            date,
                            style: Styles.regulerStyle.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(color: Palletes.greyColor);
                },
              ),
            );
          }),
    );
  }
}

class NewsStockWidget extends StatelessWidget {
  final StockCubit cubit;
  final VoidCallback onRefresh;
  const NewsStockWidget(
      {super.key, required this.cubit, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController =
        RefreshController(initialRefresh: false);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SmartRefresher(
        controller: refreshController,
        enablePullDown: true,
        enablePullUp: true,
        header: const MaterialClassicHeader(),
        onRefresh: () {
          onRefresh.call();
          refreshController.refreshCompleted();
        },
        onLoading: () {
          cubit.page++;
          cubit.fetchStockNews(false);
          refreshController.loadComplete();
        },
        child: ListView(
            physics: const AlwaysScrollableScrollPhysics(
                parent: ClampingScrollPhysics()),
            children: [
              BlocConsumer<StockCubit, StockState>(
                  bloc: cubit,
                  listener: (context, state) {},
                  buildWhen: (previous, current) {
                    return (current is StockNewsLoading ||
                        current is StockNewsLoaded ||
                        current is StockNewsError);
                  },
                  builder: (context, state) {
                    if (state is StockNewsLoading && cubit.news.isEmpty) {
                      return const LoadingNews();
                    }
                    if (state is StockNewsError) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: ErrorLoadWidget(
                            onReload: () => cubit.fetchStockNews(true)),
                      );
                    }
                    if (cubit.news.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.newsImg,
                              width: 60,
                              height: 60,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Palletes.whiteColor
                                  : Palletes.blackColor,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No news found',
                              style: Styles.titleStyle,
                            )
                          ],
                        ),
                      );
                    }
                    return NewsWidget(news: cubit.news);
                  })
            ]),
      ),
    );
  }
}

class OverviewWidget extends StatelessWidget {
  final StockCubit cubit;
  final VoidCallback onRefresh;

  const OverviewWidget(
      {super.key, required this.cubit, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController =
        RefreshController(initialRefresh: false);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocConsumer<StockCubit, StockState>(
          bloc: cubit,
          listener: (context, state) {},
          buildWhen: (previous, current) {
            return current is StockOverviewLoading ||
                current is StockOverviewLoaded ||
                current is StockOverviewError;
          },
          builder: (context, state) {
            if (state is StockOverviewLoading) {
              return Column(
                children: List.generate(10, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SkeltonWidget(width: size.width),
                  );
                }),
              );
            }
            if (state is StockOverviewError) {
              return ErrorLoadWidget(
                onReload: () => cubit.fetchStockOverview(),
              );
            }
            return SmartRefresher(
              controller: refreshController,
              enablePullDown: true,
              enablePullUp: false,
              header: const MaterialClassicHeader(),
              onRefresh: () {
                onRefresh.call();
                refreshController.refreshCompleted();
              },
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: ClampingScrollPhysics()),
                children: [
                  Text(
                    "About Company",
                    style: Styles.titleStyle.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cubit.stockOverview.general_information ?? '',
                    style: Styles.lightStyle.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Company Name",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              cubit.stockOverview.name ?? '',
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Sector",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              cubit.stockOverview.sector_name ?? '',
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Sub Sector",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              cubit.stockOverview.sub_sector_name ?? '',
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Industry",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              cubit.stockOverview.industry_name ?? '',
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Sub Industry",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              cubit.stockOverview.sub_industry_name ?? '',
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Address",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              cubit.stockOverview.address ?? '',
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Representative Name",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              cubit.stockOverview.representative_name ?? '',
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Phone",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              cubit.stockOverview.phone ?? '',
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Email",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              cubit.stockOverview.company_email ?? '',
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Website",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              cubit.stockOverview.website_url ?? '',
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "NPWP",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              cubit.stockOverview.npwp ?? '',
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Employee",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              cubit.stockOverview.total_employees ?? '-',
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Annual Dividen",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              NumberFormatUtil.formatDecimal(
                                  cubit.stockOverview.annual_dividend ?? 0,
                                  decimalDigits: 0),
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Listing Date",
                              style: Styles.lightStyle.copyWith(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              cubit.stockOverview.listing_date ?? '',
                              style: Styles.regulerStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class TrendWidget extends StatelessWidget {
  final String symbol;
  final String name;
  final StockCubit cubit;
  final VoidCallback onRefresh;
  const TrendWidget(
      {super.key,
      required this.symbol,
      required this.name,
      required this.cubit,
      required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController =
        RefreshController(initialRefresh: false);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SmartRefresher(
        controller: refreshController,
        enablePullDown: true,
        enablePullUp: false,
        header: const MaterialClassicHeader(),
        onRefresh: () {
          onRefresh.call();
          refreshController.refreshCompleted();
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: ClampingScrollPhysics()),
          children: [
            BlocConsumer<StockCubit, StockState>(
                bloc: cubit,
                listener: (context, state) {},
                buildWhen: (previous, current) {
                  return current is StockHistoricalLoading ||
                      current is StockHistoricalLoaded ||
                      current is StockHistoricalError;
                },
                builder: (context, state) {
                  if (state is StockHistoricalError) {
                    return ErrorLoadWidget(
                      onReload: () => cubit.fetchStockHistorical(),
                    );
                  }
                  return CandleWidget(
                    symbol: symbol,
                    name: name,
                    type: MarketEnum.idx,
                    isLoading: false,
                    onInterval: (String value) {
                      cubit.interval = value;
                      cubit.fetchStockHistorical();
                    },
                    onTimeframe: (String value) {
                      cubit.timeframe = value;
                      cubit.fetchStockHistorical();
                    },
                    candles: cubit.stockHistorical,
                  );
                }),
            const SizedBox(height: 16),
            BlocConsumer<StockCubit, StockState>(
                bloc: cubit,
                listener: (context, state) {},
                buildWhen: (previous, current) {
                  return current is StockQuoteLoading ||
                      current is StockQuoteLoaded ||
                      current is StockQuoteError;
                },
                builder: (context, state) {
                  if (state is StockQuoteLoading) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SkeltonWidget(width: 40),
                        SizedBox(height: 8),
                        SkeltonWidget(width: 30),
                      ],
                    );
                  }

                  if (state is StockQuoteError) {
                    return const SizedBox();
                  }

                  double close = cubit.stockQuote.close ?? 0;
                  double change = cubit.stockQuote.change ?? 0;
                  double changePercent = cubit.stockQuote.changePercent ?? 0;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        NumberFormatUtil.formatDecimal(close, decimalDigits: 2),
                        style: Styles.titleStyle.copyWith(fontSize: 28),
                      ),
                      Text(
                        '${NumberFormatUtil.formatChange(change, decimalDigits: 2)} (${NumberFormatUtil.formatChange(changePercent, decimalDigits: 2)}%)',
                        style: Styles.regulerStyle.copyWith(
                            fontSize: 16,
                            color: changePercent > 0
                                ? Palletes.bullishColor
                                : changePercent < 0
                                    ? Palletes.bearishColor
                                    : null),
                      ),
                    ],
                  );
                }),
            const SizedBox(height: 8),
            BlocConsumer<StockCubit, StockState>(
                bloc: cubit,
                listener: (context, state) {},
                buildWhen: (previous, current) {
                  return current is StockQuoteLoading ||
                      current is StockQuoteLoaded ||
                      current is StockQuoteError;
                },
                builder: (context, state) {
                  if (state is StockQuoteLoading) {
                    return const QuoteLoadingWidget();
                  }

                  if (state is StockQuoteError) {
                    return ErrorLoadWidget(
                      onReload: () => cubit.fetchStockQuote(),
                    );
                  }
                  return QuoteWidget(
                    quote: cubit.stockQuote,
                    decimal: 2,
                  );
                }),
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Marker Analyze',
                  style: Styles.titleStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 200,
                  child: TradingviewWidget(
                    symbol: getSymbol(symbol, MarketEnum.idx),
                    theme: Theme.of(context).brightness == Brightness.dark
                        ? "dark"
                        : "light",
                    type: TradingviewEnum.technicalAnalyze,
                  ),
                ),
                const SizedBox(height: 16),
                BlocConsumer<StockCubit, StockState>(
                    bloc: cubit,
                    listener: (context, state) {},
                    buildWhen: (previous, current) {
                      return current is StockRecommendationLoading ||
                          current is StockRecommendationLoaded ||
                          current is StockRecommendationError;
                    },
                    builder: (context, state) {
                      if (state is StockRecommendationLoading) {
                        return const SkeltonAnalyze();
                      }

                      if (state is StockRecommendationError) {
                        return ErrorLoadWidget(
                          onReload: () => cubit.fetchStockRecommendation(),
                        );
                      }

                      String recommendation =
                          cubit.stockRecommendation.recommendation ?? '';
                      String description =
                          cubit.stockRecommendation.description ?? '-';
                      double targetPrice =
                          cubit.stockRecommendation.targetPrice ?? 0;
                      double predictedPrice =
                          cubit.stockRecommendation.predictedPrice ?? 0;
                      double stopLose = cubit.stockRecommendation.stopLoss ?? 0;
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: recommendation == 'BUY'
                                  ? Palletes.bullishColor
                                  : recommendation == 'SELL'
                                      ? Palletes.bearishColor
                                      : Palletes.secondaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                recommendation.toUpperCase(),
                                style: Styles.titleStyle.copyWith(
                                    fontSize: 18, color: Palletes.whiteColor),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  description,
                                  style: Styles.regulerStyle
                                      .copyWith(fontSize: 14),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Predicted Price',
                                          style: Styles.lightStyle
                                              .copyWith(fontSize: 12),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          NumberFormatUtil.formatDecimal(
                                              predictedPrice,
                                              decimalDigits: 0),
                                          style: Styles.regulerStyle
                                              .copyWith(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Target Price',
                                          style: Styles.lightStyle
                                              .copyWith(fontSize: 12),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          NumberFormatUtil.formatDecimal(
                                              targetPrice,
                                              decimalDigits: 0),
                                          style: Styles.regulerStyle
                                              .copyWith(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Stop Loss',
                                          style: Styles.lightStyle
                                              .copyWith(fontSize: 12),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          NumberFormatUtil.formatDecimal(
                                              stopLose,
                                              decimalDigits: 0),
                                          style: Styles.regulerStyle
                                              .copyWith(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ],
            ),
            const SizedBox(height: 24),
            BlocConsumer<StockCubit, StockState>(
                bloc: cubit,
                listener: (context, state) {},
                buildWhen: (previous, current) {
                  return current is TrendAnalyzeLoading ||
                      current is TrendAnalyzeLoaded ||
                      current is TrendAnalyzeError;
                },
                builder: (context, state) {
                  if (state is TrendAnalyzeLoading) {
                    return Column(
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SkeltonWidget(width: size.width),
                        );
                      }),
                    );
                  }
                  if (state is TrendAnalyzeError) {
                    return ErrorLoadWidget(
                      onReload: () => cubit.getTrendAnalyze(),
                    );
                  }
                  return Text(
                    cubit.trendAnalyze,
                    style: Styles.lightStyle,
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class StockDetailAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String symbol;
  final String name;

  const StockDetailAppBarWidget(
      {super.key, required this.symbol, required this.name});

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
            FormatUtil().getSymbol(symbol),
            style: Styles.titleStyle.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: Styles.lightStyle.copyWith(fontSize: 11),
          ),
        ],
      ),
      actions: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SizedBox(
              child: AppIcons.shareIcon,
            ),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SizedBox(
              child: AppIcons.watchlistIcon,
            ),
          ),
        ),
      ],
      bottom: TabBar(
        indicatorColor: Palletes.secondaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Palletes.secondaryColor,
        labelStyle: Styles.regulerStyle,
        labelPadding: const EdgeInsets.all(8),
        indicatorPadding: const EdgeInsets.only(bottom: 3),
        tabs: const [
          Tab(text: "Trend"),
          Tab(text: "Financial"),
          Tab(text: "Actions"),
          Tab(text: "News"),
          Tab(text: "Overview"),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(120.0, 120.0);
}
