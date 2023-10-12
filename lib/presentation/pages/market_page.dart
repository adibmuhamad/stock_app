import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/core/constants/app_icons.dart';
import 'package:stock_app/core/constants/enums.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';
import 'package:stock_app/core/utils/format_util.dart';
import 'package:stock_app/core/utils/navigation_util.dart';
import 'package:stock_app/core/utils/number_format_util.dart';
import 'package:stock_app/injection_container.dart';
import 'package:stock_app/presentation/cubit/market_cubit.dart';
import 'package:stock_app/presentation/widgets/candle_widget.dart';
import 'package:stock_app/presentation/widgets/error_load_widget.dart';
import 'package:stock_app/presentation/widgets/quote_widget.dart';
import 'package:stock_app/presentation/widgets/skelton_widget.dart';
import 'package:stock_app/presentation/widgets/tab_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stock_app/presentation/widgets/tradingview_widget.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  late MarketCubit _marketCubit;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void onLoad() {
    _marketCubit.fetchSimpleStocks();
    _marketCubit.fetchIhsgQuote();
    _marketCubit.fetchIhsgHistorical();
    _marketCubit.fetchIndices();
    _marketCubit.fetchMarket();
  }

  @override
  void initState() {
    _marketCubit = context.read<MarketCubit>();

    onLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      enablePullUp: false,
      header: const MaterialClassicHeader(),
      onRefresh: () {
        onLoad();
        _refreshController.refreshCompleted();
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              IhsgWidget(cubit: _marketCubit),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: Palletes.greyColor),
              ),
              IndicesWidget(cubit: _marketCubit),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: Palletes.greyColor),
              ),
              MarketTrendWidget(cubit: _marketCubit),
              MarketWidget(cubit: _marketCubit),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: Palletes.greyColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MarketTrendWidget extends StatelessWidget {
  final MarketCubit cubit;
  const MarketTrendWidget({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Market Trends',
          style: Styles.titleStyle.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 16),
        const SizedBox(
          height: 250,
          child: TradingviewWidget(
            symbol: '',
            theme: '',
            type: TradingviewEnum.market,
          ),
        ),
      ],
    );
  }
}

class MarketWidget extends StatelessWidget {
  final MarketCubit cubit;
  const MarketWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabWidget(
          currentTab: cubit.marketIndex,
          tabs: const ['LQ46', 'Stocks', 'Mutual Fund', 'US Stocks', 'Crypto'],
          onTab: (int value) {
            cubit.marketIndex = value;
            cubit.fetchMarket();
          },
          main: BlocConsumer<MarketCubit, MarketState>(
              bloc: cubit,
              listener: (context, state) {},
              buildWhen: (previous, current) {
                return current is MarketLoading ||
                    current is MarketLoaded ||
                    current is MarketError;
              },
              builder: (context, state) {
                if (state is MarketLoading) {
                  return const SkeltonListWidget(length: 10);
                }
                if (state is MarketError || cubit.markets.isEmpty) {
                  return ErrorLoadWidget(
                    onReload: () => cubit.fetchIhsgQuote(),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(cubit.markets.length, (index) {
                    int id = cubit.markets[index].id ?? 0;
                    String symbol = cubit.markets[index].symbol ?? '';
                    String name = cubit.markets[index].name ?? '';
                    double close = cubit.markets[index].close ?? 0;
                    double change = cubit.markets[index].change ?? 0;
                    double changePercent =
                        cubit.markets[index].changePercent ?? 0;

                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if (cubit.marketIndex == 0 || cubit.marketIndex == 1) {
                          getIt<NavigationUtil>().navigateTo('StockDetail',
                              arguments: {
                                'symbol': symbol,
                                'name': name,
                                'type': 0
                              });
                        } else  if (cubit.marketIndex == 2) {
                          getIt<NavigationUtil>().navigateTo('MutualFundDetail',
                              arguments: {
                                'name': symbol,
                                'type': name,
                                'id': id
                              });
                        } else if (cubit.marketIndex == 3) {
                          getIt<NavigationUtil>().navigateTo('QuoteDetail',
                              arguments: {
                                'symbol': symbol,
                                'name': name,
                                'type': 1
                              });
                        }
                        if (cubit.marketIndex == 4) {
                          getIt<NavigationUtil>().navigateTo('QuoteDetail',
                              arguments: {
                                'symbol': symbol,
                                'name': name,
                                'type': 2
                              });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: (index + 1 < cubit.markets.length)
                                ? BorderSide(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Palletes.whiteColor.withOpacity(.2)
                                        : Palletes.blackColor.withOpacity(.2))
                                : BorderSide.none,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: Palletes.secondaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      symbol.length > 2
                                          ? FormatUtil()
                                              .getSymbol(symbol)
                                              .toUpperCase()
                                              .substring(0, 2)
                                          : 'XX',
                                      style: Styles.titleStyle.copyWith(
                                          fontSize: 18,
                                          color: Palletes.whiteColor),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SizedBox(
                                  width: size.width * .4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FormatUtil()
                                            .getSymbol(symbol)
                                            .toUpperCase(),
                                        style: Styles.titleStyle
                                            .copyWith(fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        name,
                                        style: Styles.lightStyle
                                            .copyWith(fontSize: 12),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  NumberFormatUtil.formatDecimal(close,
                                      decimalDigits: (cubit.marketIndex == 0 ||
                                              cubit.marketIndex == 1)
                                          ? 0
                                          : cubit.marketIndex == 4
                                              ? 4
                                              : 2),
                                  style:
                                      Styles.titleStyle.copyWith(fontSize: 14),
                                ),
                                Text(
                                  '${NumberFormatUtil.formatChange(change, decimalDigits: (cubit.marketIndex == 0 || cubit.marketIndex == 1) ? 0 : cubit.marketIndex == 4 ? 4 : 2)} (${NumberFormatUtil.formatChange(changePercent, decimalDigits: cubit.marketIndex == 4 ? 4 : 2)}%)',
                                  style: Styles.regulerStyle.copyWith(
                                      fontSize: 12,
                                      color: changePercent > 0
                                          ? Palletes.bullishColor
                                          : changePercent < 0
                                              ? Palletes.bearishColor
                                              : null),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }),
        ),
        const SizedBox(height: 8),
        BlocConsumer<MarketCubit, MarketState>(
            bloc: cubit,
            listener: (context, state) {},
            buildWhen: (previous, current) {
              return current is MarketLoading ||
                  current is MarketLoaded ||
                  current is MarketError;
            },
            builder: (context, state) {
              if (state is MarketError || cubit.markets.isEmpty) {
                return const SizedBox();
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ((cubit.markets[0].lastUpdated ?? '').isNotEmpty)
                      ? Text(
                          '*last updated: ${cubit.markets[0].lastUpdated}',
                          style: Styles.lightStyle.copyWith(fontSize: 8),
                        )
                      : const SizedBox(),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: SizedBox(
                      child: Text(
                        'See more',
                        style: Styles.regulerStyle.copyWith(
                            fontSize: 14, color: Palletes.secondaryColor),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ],
    );
  }
}

class IndicesWidget extends StatelessWidget {
  final MarketCubit cubit;
  const IndicesWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabWidget(
          currentTab: cubit.indicesIndex,
          tabs: const [
            'Global',
            'Local',
            'Currencies',
            'Sectors',
            'Commodities'
          ],
          onTab: (int value) {
            cubit.indicesIndex = value;
            cubit.fetchIndices();
          },
          main: BlocConsumer<MarketCubit, MarketState>(
              bloc: cubit,
              listener: (context, state) {},
              buildWhen: (previous, current) {
                return current is IndicesLoading ||
                    current is IndicesLoaded ||
                    current is IndicesError;
              },
              builder: (context, state) {
                if (state is IndicesLoading) {
                  return const SkeltonListCardWidget();
                }

                if (state is IndicesError || cubit.indices.isEmpty) {
                  return ErrorLoadWidget(
                    onReload: () => cubit.fetchIndices(),
                  );
                }
                return SizedBox(
                  height: 100,
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(cubit.indices.length, (index) {
                      String symbol = cubit.indices[index].symbol ?? '';
                      String name = cubit.indices[index].name ?? '';
                      double close = cubit.indices[index].close ?? 0;
                      double change = cubit.indices[index].change ?? 0;
                      double changePercent =
                          cubit.indices[index].changePercent ?? 0;

                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          if (cubit.indicesIndex == 2 ||
                              cubit.indicesIndex == 4) {
                            getIt<NavigationUtil>().navigateTo('QuoteDetail',
                                arguments: {'symbol': symbol, 'name': name});
                          } else {
                            getIt<NavigationUtil>().navigateTo('IndicesDetail',
                                arguments: {'symbol': symbol, 'name': name});
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Container(
                            width: 150,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Palletes.whiteColor.withOpacity(.2)
                                      : Palletes.blackColor.withOpacity(.2)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  name.toUpperCase().trim(),
                                  style:
                                      Styles.titleStyle.copyWith(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      NumberFormatUtil.formatDecimal(close,
                                          decimalDigits: 2),
                                      style: Styles.titleStyle
                                          .copyWith(fontSize: 14),
                                    ),
                                    const SizedBox(width: 4),
                                    (changePercent > 0)
                                        ? AppIcons.bullishIcon
                                        : (changePercent < 0)
                                            ? AppIcons.bearishIcon
                                            : const SizedBox(),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${NumberFormatUtil.formatChange(change, decimalDigits: 2)} (${NumberFormatUtil.formatChange(changePercent, decimalDigits: 2)}%)',
                                  style: Styles.regulerStyle.copyWith(
                                      fontSize: 12,
                                      color: changePercent > 0
                                          ? Palletes.bullishColor
                                          : changePercent < 0
                                              ? Palletes.bearishColor
                                              : null),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }),
        ),
        const SizedBox(height: 16),
        BlocConsumer<MarketCubit, MarketState>(
            bloc: cubit,
            listener: (context, state) {},
            buildWhen: (previous, current) {
              return current is IndicesLoading ||
                  current is IndicesLoaded ||
                  current is IndicesError;
            },
            builder: (context, state) {
              if (state is IndicesError || cubit.indices.isEmpty) {
                return const SizedBox();
              }
              return ((cubit.indices[0].lastUpdated ?? '').isNotEmpty)
                  ? Text(
                      '*last updated: ${cubit.indices[0].lastUpdated}',
                      style: Styles.lightStyle.copyWith(fontSize: 8),
                    )
                  : const SizedBox();
            }),
        const SizedBox(height: 16),
      ],
    );
  }
}

class IhsgWidget extends StatelessWidget {
  final MarketCubit cubit;
  const IhsgWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'IHSG',
                  style: Styles.titleStyle.copyWith(fontSize: 24),
                ),
                Text(
                  'Indeks Harga Saham Gabungan',
                  style: Styles.lightStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
            BlocConsumer<MarketCubit, MarketState>(
                bloc: cubit,
                listener: (context, state) {},
                buildWhen: (previous, current) {
                  return current is IhsgQuoteLoading ||
                      current is IhsgQuoteLoaded ||
                      current is IhsgQuoteError;
                },
                builder: (context, state) {
                  if (state is IhsgQuoteLoading) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        SkeltonWidget(width: 40),
                        SizedBox(height: 8),
                        SkeltonWidget(width: 30),
                      ],
                    );
                  }

                  double close = cubit.ihsgQuote.close ?? 0;
                  double change = cubit.ihsgQuote.change ?? 0;
                  double changePercent = cubit.ihsgQuote.changePercent ?? 0;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        NumberFormatUtil.formatDecimal(close, decimalDigits: 2),
                        style: Styles.titleStyle.copyWith(fontSize: 18),
                      ),
                      Text(
                        '${NumberFormatUtil.formatChange(change, decimalDigits: 2)} (${NumberFormatUtil.formatChange(changePercent, decimalDigits: 2)}%)',
                        style: Styles.regulerStyle.copyWith(
                            fontSize: 12,
                            color: changePercent > 0
                                ? Palletes.bullishColor
                                : changePercent < 0
                                    ? Palletes.bearishColor
                                    : null),
                      ),
                    ],
                  );
                }),
          ],
        ),
        const SizedBox(height: 8),
        BlocConsumer<MarketCubit, MarketState>(
            bloc: cubit,
            listener: (context, state) {},
            buildWhen: (previous, current) {
              return current is IhsgHistoricalLoading ||
                  current is IhsgHistoricalLoaded ||
                  current is IhsgHistoricalError;
            },
            builder: (context, state) {
              if (state is IhsgHistoricalError) {
                return ErrorLoadWidget(
                  onReload: () => cubit.fetchIhsgHistorical(),
                );
              }
              return CandleWidget(
                symbol: 'COMPOSITE',
                name: 'Indek Harga Saham Gabungan',
                type: MarketEnum.idx,
                isLoading: state is IhsgHistoricalLoading,
                onInterval: (String value) {
                  cubit.interval = value;
                  cubit.fetchIhsgHistorical();
                },
                onTimeframe: (String value) {
                  cubit.timeframe = value;
                  cubit.fetchIhsgHistorical();
                },
                candles: cubit.ihsgHistorical,
              );
            }),
        const SizedBox(height: 8),
        BlocConsumer<MarketCubit, MarketState>(
            bloc: cubit,
            listener: (context, state) {},
            buildWhen: (previous, current) {
              return current is IhsgQuoteLoading ||
                  current is IhsgQuoteLoaded ||
                  current is IhsgQuoteError;
            },
            builder: (context, state) {
              if (state is IhsgQuoteLoading) {
                return const QuoteLoadingWidget();
              }

              if (state is IhsgQuoteError) {
                return ErrorLoadWidget(
                  onReload: () => cubit.fetchIhsgQuote(),
                );
              }
              return QuoteWidget(
                quote: cubit.ihsgQuote,
                decimal: 2,
              );
            }),
        const SizedBox(height: 8),
        BlocConsumer<MarketCubit, MarketState>(
            bloc: cubit,
            listener: (context, state) {},
            buildWhen: (previous, current) {
              return current is IhsgQuoteLoading ||
                  current is IhsgQuoteLoaded ||
                  current is IhsgQuoteError;
            },
            builder: (context, state) {
              if (state is IhsgQuoteError) {
                return const SizedBox();
              }
              return ((cubit.ihsgQuote.lastUpdated ?? '').isNotEmpty)
                  ? Text(
                      '*last updated: ${cubit.ihsgQuote.lastUpdated}',
                      style: Styles.lightStyle.copyWith(fontSize: 8),
                    )
                  : const SizedBox();
            }),
        const SizedBox(height: 16),
      ],
    );
  }
}
