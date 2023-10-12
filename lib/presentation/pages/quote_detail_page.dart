import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stock_app/core/constants/app_icons.dart';
import 'package:stock_app/core/constants/enums.dart';
import 'package:stock_app/core/constants/images.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';
import 'package:stock_app/core/utils/format_util.dart';
import 'package:stock_app/core/utils/number_format_util.dart';
import 'package:stock_app/presentation/cubit/indices_cubit.dart';
import 'package:stock_app/presentation/pages/news_page.dart';
import 'package:stock_app/presentation/widgets/candle_widget.dart';
import 'package:stock_app/presentation/widgets/error_load_widget.dart';
import 'package:stock_app/presentation/widgets/quote_widget.dart';
import 'package:stock_app/presentation/widgets/skelton_widget.dart';
import 'package:stock_app/presentation/widgets/tradingview_widget.dart';

class QuoteDetailPage extends StatefulWidget {
  final Map? data;
  const QuoteDetailPage({super.key, this.data});

  @override
  State<QuoteDetailPage> createState() => _QuoteDetailPageState();
}

class _QuoteDetailPageState extends State<QuoteDetailPage> {
  late IndicesCubit _quoteCubit;

  void onLoad() {
    _quoteCubit.fetchIndexQuote();
    _quoteCubit.fetchIndexHistorical();
    _quoteCubit.getTrendAnalyze();
    _quoteCubit.fetchIndexNews(true);
  }

  @override
  void initState() {
    _quoteCubit = context.read<IndicesCubit>();

    if (widget.data != null) {
      _quoteCubit.symbol = widget.data!['symbol'] ?? '';
      _quoteCubit.name = widget.data!['name'] ?? '';
      _quoteCubit.type = MarketEnum.values[widget.data!['type'] ?? 0];

      onLoad();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: QuoteDetailAppBarWidget(
            symbol: _quoteCubit.symbol, name: _quoteCubit.name),
        body: TabBarView(children: [
          TrendWidget(
            symbol: _quoteCubit.symbol,
            name: _quoteCubit.name,
            cubit: _quoteCubit,
            onRefresh: () => onLoad(),
          ),
          NewsStockWidget(
            cubit: _quoteCubit,
            onRefresh: () => onLoad(),
          ),
        ]),
      ),
    );
  }
}

class NewsStockWidget extends StatelessWidget {
  final IndicesCubit cubit;
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
          cubit.fetchIndexNews(false);
          refreshController.loadComplete();
        },
        child: ListView(
            physics: const AlwaysScrollableScrollPhysics(
                parent: ClampingScrollPhysics()),
            children: [
              BlocConsumer<IndicesCubit, IndicesState>(
                  bloc: cubit,
                  listener: (context, state) {},
                  buildWhen: (previous, current) {
                    return (current is IndicesNewsLoading ||
                        current is IndicesNewsLoaded ||
                        current is IndicesNewsError);
                  },
                  builder: (context, state) {
                    if (state is IndicesNewsLoading && cubit.news.isEmpty) {
                      return const LoadingNews();
                    }

                    if (state is IndicesNewsError) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: ErrorLoadWidget(
                            onReload: () => cubit.fetchIndexNews(true)),
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

class TrendWidget extends StatelessWidget {
  final String symbol;
  final String name;
  final IndicesCubit cubit;
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
            BlocConsumer<IndicesCubit, IndicesState>(
                bloc: cubit,
                listener: (context, state) {},
                buildWhen: (previous, current) {
                  return current is IndicesHistoricalLoading ||
                      current is IndicesHistoricalLoaded ||
                      current is IndicesHistoricalError;
                },
                builder: (context, state) {
                  if (state is IndicesHistoricalError) {
                    return ErrorLoadWidget(
                      onReload: () => cubit.fetchIndexHistorical(),
                    );
                  }
                  return CandleWidget(
                    symbol: symbol,
                    name: name,
                    type: cubit.type,
                    isLoading: false,
                    onInterval: (String value) {
                      cubit.interval = value;
                      cubit.fetchIndexHistorical();
                    },
                    onTimeframe: (String value) {
                      cubit.timeframe = value;
                      cubit.fetchIndexHistorical();
                    },
                    candles: cubit.indexHistorical,
                  );
                }),
            const SizedBox(height: 16),
            BlocConsumer<IndicesCubit, IndicesState>(
                bloc: cubit,
                listener: (context, state) {},
                buildWhen: (previous, current) {
                  return current is IndicesQuoteLoading ||
                      current is IndicesQuoteLoaded ||
                      current is IndicesQuoteError;
                },
                builder: (context, state) {
                  if (state is IndicesQuoteLoading) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SkeltonWidget(width: 40),
                        SizedBox(height: 8),
                        SkeltonWidget(width: 30),
                      ],
                    );
                  }

                  if (state is IndicesQuoteError) {
                    return const SizedBox();
                  }

                  double close = cubit.indexQuote.close ?? 0;
                  double change = cubit.indexQuote.change ?? 0;
                  double changePercent = cubit.indexQuote.changePercent ?? 0;
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
            BlocConsumer<IndicesCubit, IndicesState>(
                bloc: cubit,
                listener: (context, state) {},
                buildWhen: (previous, current) {
                  return current is IndicesQuoteLoading ||
                      current is IndicesQuoteLoaded ||
                      current is IndicesQuoteError;
                },
                builder: (context, state) {
                  if (state is IndicesQuoteLoading) {
                    return const QuoteLoadingWidget();
                  }

                  if (state is IndicesQuoteError) {
                    return ErrorLoadWidget(
                      onReload: () => cubit.fetchIndexQuote(),
                    );
                  }
                  return QuoteWidget(
                    quote: cubit.indexQuote,
                    decimal: 2,
                  );
                }),
            const SizedBox(height: 24),
            (cubit.type != null)
                ? SizedBox(
                    height: 200,
                    child: TradingviewWidget(
                      symbol: getSymbol(symbol, cubit.type!),
                      theme: Theme.of(context).brightness == Brightness.dark
                          ? "dark"
                          : "light",
                      type: TradingviewEnum.technicalAnalyze,
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 16),
            BlocConsumer<IndicesCubit, IndicesState>(
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

class QuoteDetailAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String symbol;
  final String name;

  const QuoteDetailAppBarWidget(
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
          Tab(text: "News"),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(120.0, 120.0);
}
