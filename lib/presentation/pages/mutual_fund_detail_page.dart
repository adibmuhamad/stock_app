import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stock_app/core/constants/app_icons.dart';
import 'package:stock_app/core/constants/images.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';
import 'package:stock_app/core/utils/date_util.dart';
import 'package:stock_app/core/utils/number_format_util.dart';
import 'package:stock_app/data/models/mutual_fund_model.dart';
import 'package:stock_app/presentation/cubit/mutual_fund_cubit.dart';
import 'package:stock_app/presentation/pages/news_page.dart';
import 'package:stock_app/presentation/widgets/candle_widget.dart';
import 'package:stock_app/presentation/widgets/error_load_widget.dart';
import 'package:stock_app/presentation/widgets/line_widget.dart';
import 'package:stock_app/presentation/widgets/quote_widget.dart';
import 'package:stock_app/presentation/widgets/skelton_widget.dart';
import 'package:stock_app/presentation/widgets/tradingview_widget.dart';

class MutualFundDetailPage extends StatefulWidget {
  final Map? data;
  const MutualFundDetailPage({super.key, this.data});

  @override
  State<MutualFundDetailPage> createState() => _MutualFundDetailPageState();
}

class _MutualFundDetailPageState extends State<MutualFundDetailPage> {
  late MutualFundCubit _mutualFundCubit;

  void onLoad() {
    _mutualFundCubit.fetchMutualFund();
  }

  @override
  void initState() {
    _mutualFundCubit = context.read<MutualFundCubit>();

    if (widget.data != null) {
      _mutualFundCubit.id = (widget.data!['id'] ?? 0).toString();
      _mutualFundCubit.name = widget.data!['name'] ?? '';
      _mutualFundCubit.type = widget.data!['type'] ?? '';

      onLoad();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MutualFundDetailAppBarWidget(
            name: _mutualFundCubit.name, type: _mutualFundCubit.type),
        body: TabBarView(children: [
          PerformanceWidget(
            type: _mutualFundCubit.type,
            name: _mutualFundCubit.name,
            cubit: _mutualFundCubit,
            onRefresh: () {},
          ),
          SizedBox(),
        ]),
      ),
    );
  }
}

class MutualFundDetailAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String type;
  final String name;

  const MutualFundDetailAppBarWidget(
      {super.key, required this.type, required this.name});

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
            type.toUpperCase(),
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
      ],
      bottom: TabBar(
        indicatorColor: Palletes.secondaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Palletes.secondaryColor,
        labelStyle: Styles.regulerStyle,
        labelPadding: const EdgeInsets.all(8),
        indicatorPadding: const EdgeInsets.only(bottom: 3),
        tabs: const [
          Tab(text: "Performance"),
          Tab(text: "Overview"),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(120.0, 120.0);
}

class PerformanceWidget extends StatelessWidget {
  final String type;
  final String name;
  final MutualFundCubit cubit;
  final VoidCallback onRefresh;
  const PerformanceWidget(
      {super.key,
      required this.type,
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
            BlocConsumer<MutualFundCubit, MutualFundState>(
                bloc: cubit,
                listener: (context, state) {},
                buildWhen: (previous, current) {
                  return current is MutualFundLoading ||
                      current is MutualFundLoaded ||
                      current is MutualFundError;
                },
                builder: (context, state) {
                  if (state is MutualFundError) {
                    return ErrorLoadWidget(
                      onReload: () => cubit.fetchMutualFund(),
                    );
                  }
                  return LineWidget(
                    name: name,
                    isLoading: false,
                    charts: cubit.charts,
                  );
                }),
            const SizedBox(height: 24),
            BlocConsumer<MutualFundCubit, MutualFundState>(
                bloc: cubit,
                listener: (context, state) {},
                buildWhen: (previous, current) {
                  return current is MutualFundLoading ||
                      current is MutualFundLoaded ||
                      current is MutualFundError;
                },
                builder: (context, state) {
                  if (state is MutualFundError) {
                    return ErrorLoadWidget(
                      onReload: () => cubit.fetchMutualFund(),
                    );
                  }

                  List<NetAssetValue> nav =
                      (cubit.mutualFundData.net_asset_values ?? []);

                  if (nav.isEmpty) {
                    return const SizedBox();
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: Styles.titleStyle.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          (nav.length > 1)
                              ? Column(
                                  children: [
                                    Text(
                                      'Previous NAV',
                                      style: Styles.lightStyle
                                          .copyWith(fontSize: 11),
                                    ),
                                    Text(
                                      NumberFormatUtil.formatDecimal(
                                          nav[nav.length - 2].value ?? 0,
                                          decimalDigits: 4),
                                      style: Styles.regulerStyle
                                          .copyWith(fontSize: 28),
                                    ),
                                    Text(
                                      DateUtil.convertToString(
                                          nav[nav.length - 2].date ??
                                              DateTime.now()),
                                      style: Styles.lightStyle
                                          .copyWith(fontSize: 11),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          Column(
                            children: [
                              Text(
                                'Last NAV',
                                style: Styles.lightStyle.copyWith(fontSize: 11),
                              ),
                              Text(
                                NumberFormatUtil.formatDecimal(
                                    nav.last.value ?? 0,
                                    decimalDigits: 4),
                                style:
                                    Styles.regulerStyle.copyWith(fontSize: 28),
                              ),
                              Text(
                                DateUtil.convertToString(
                                    nav.last.date ?? DateTime.now()),
                                style: Styles.lightStyle.copyWith(fontSize: 11),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Past NAV',
                        style: Styles.titleStyle.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        children: List.generate(
                            nav.length < 10 ? nav.length : 10, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateUtil.convertToString(
                                          nav[nav.length - (index + 1)].date ??
                                              DateTime.now()),
                                      style: Styles.lightStyle
                                          .copyWith(fontSize: 11),
                                    ),
                                    Text(
                                      NumberFormatUtil.formatDecimal(
                                          nav[nav.length - (index + 1)].value ??
                                              0,
                                          decimalDigits: 4),
                                      style: Styles.regulerStyle
                                          .copyWith(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Daily Return',
                                      style: Styles.lightStyle
                                          .copyWith(fontSize: 11),
                                    ),
                                    Text(
                                      NumberFormatUtil.formatDecimal(
                                          (nav[nav.length - (index + 1)]
                                                      .daily_return ??
                                                  0) *
                                              100,
                                          decimalDigits: 2),
                                      style: Styles.regulerStyle.copyWith(
                                          fontSize: 14,
                                          color: (nav[nav.length - (index + 1)]
                                                          .daily_return ??
                                                      0) >
                                                  0
                                              ? Palletes.bullishColor
                                              : (nav[nav.length - (index + 1)]
                                                              .daily_return ??
                                                          0) <
                                                      0
                                                  ? Palletes.bearishColor
                                                  : null),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 30),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
