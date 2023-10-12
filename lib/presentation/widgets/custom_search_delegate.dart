import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/core/constants/app_icons.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';
import 'package:stock_app/core/utils/navigation_util.dart';
import 'package:stock_app/data/database/database.dart';
import 'package:stock_app/injection_container.dart';
import 'package:stock_app/presentation/cubit/market_cubit.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<SimpleStockData> suggestions = [
    const SimpleStockData(
        symbol: 'BBRI', name: 'Bank Rakyat Indonesia (Persero)'),
    const SimpleStockData(symbol: 'BBCA', name: 'Bank Central Asia Tbk'),
    const SimpleStockData(symbol: 'GOTO', name: 'PT GoTo Gojek Tokopedia Tbk'),
    const SimpleStockData(symbol: 'ADRO', name: 'PT Adaro Energy Indonesia Tbk')
  ];

  List<SimpleStockData> searchResults = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => query = '',
          child: AppIcons.closeIcon,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => close(context, null),
        child: AppIcons.backIcon,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final marketCubit = context.read<MarketCubit>();
    searchResults.clear();

    searchResults = marketCubit.simpleStocks
        .where((element) =>
            element.symbol.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search Result',
            style: Styles.titleStyle.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Palletes.whiteColor
                    : Palletes.blackColor,
                fontSize: 16),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: size.height * .8,
            child: ListView(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                scrollDirection: Axis.vertical,
                children: List.generate(searchResults.length, (index) {
                  var item = searchResults[index];
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => getIt<NavigationUtil>().navigateTo(
                        'StockDetail',
                        arguments: {'symbol': item.symbol, 'name': item.name, 'type': 0}),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              item.symbol,
                              style: Styles.titleStyle.copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Palletes.whiteColor
                                      : Palletes.blackColor),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 6,
                            child: Text(
                              item.name,
                              style: Styles.lightStyle.copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Palletes.whiteColor
                                      : Palletes.blackColor,
                                  fontSize: 11),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final marketCubit = context.read<MarketCubit>();
    final suggestionList = query.isEmpty
        ? suggestions
        : marketCubit.simpleStocks
            .where((element) =>
                element.symbol.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        query.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: Text(
                  'Top Search',
                  style: Styles.titleStyle.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Palletes.whiteColor
                          : Palletes.blackColor,
                      fontSize: 16),
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 8),
        SizedBox(
          height: size.height * .8,
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                if (query.isEmpty) {
                  query = suggestions[index].symbol;
                }

                getIt<NavigationUtil>().navigateTo('StockDetail', arguments: {
                  'symbol': suggestionList[index].symbol,
                  'name': suggestionList[index].name,
                  'type': 0,
                });
              },
              leading: Icon(query.isEmpty ? Icons.history : Icons.search),
              title: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: RichText(
                        text: TextSpan(
                            text: suggestionList[index]
                                .symbol
                                .substring(0, query.length),
                            style: Styles.titleStyle
                                .copyWith(color: Palletes.secondaryColor),
                            children: [
                          TextSpan(
                            text: suggestionList[index]
                                .symbol
                                .substring(query.length),
                            style: Styles.titleStyle.copyWith(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Palletes.whiteColor
                                    : Palletes.blackColor),
                          )
                        ])),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 6,
                    child: Text(
                      suggestionList[index].name,
                      style: Styles.lightStyle.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Palletes.whiteColor
                              : Palletes.blackColor,
                          fontSize: 11),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            itemCount: suggestionList.length,
          ),
        ),
      ],
    );
  }
}
