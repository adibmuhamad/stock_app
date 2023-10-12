import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:stock_app/core/constants/app_icons.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TopMoverWidget(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(color: Palletes.greyColor),
          ),
          WatchlistWidget(),
        ],
      ),
    );
  }
}

class WatchlistWidget extends StatelessWidget {
  const WatchlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Watchlist',
              style: Styles.titleStyle.copyWith(fontSize: 20),
            ),
            IconButton(
              onPressed: () {},
              icon: AppIcons.addIcon,
              color: Palletes.secondaryColor,
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: size.height * .45,
          child: ListView(
              physics: const ClampingScrollPhysics(),
              children: List.generate(5, (index) {
                return SwipeActionCell(
                  key: ObjectKey(index),
                  trailingActions: <SwipeAction>[
                    SwipeAction(
                        title: "Remove",
                        style: Styles.regulerStyle,
                        onTap: (CompletionHandler handler) async {},
                        color: Palletes.bearishColor),
                  ],
                  child: SimpleFoldingCell.create(
                    frontWidget: _buildFrontWidget(index),
                    innerWidget: _buildInnerWidget(index),
                    cellSize: Size(MediaQuery.of(context).size.width, 80),
                    animationDuration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    onOpen: () {},
                    onClose: () {},
                  ),
                );
              })),
        ),
      ],
    );
  }

  Widget _buildFrontWidget(int index) {
    return Builder(
      builder: (BuildContext context) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            final foldingCellState =
                context.findAncestorStateOfType<SimpleFoldingCellState>();
            foldingCellState?.toggleFold();
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: (index + 1 < 5)
                    ? BorderSide(color: Palletes.whiteColor.withOpacity(.2))
                    : BorderSide.none,
              ),
              color: Theme.of(context).brightness == Brightness.dark
                  ? Palletes.blackColor
                  : Palletes.whiteColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Palletes.bullishColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          'BUY',
                          style: Styles.titleStyle.copyWith(
                              fontSize: 18, color: Palletes.whiteColor),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BBRI $index',
                          style: Styles.titleStyle.copyWith(fontSize: 16),
                        ),
                        Text(
                          'Bank Rakyat Indonesia',
                          style: Styles.lightStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '3700',
                      style: Styles.titleStyle.copyWith(fontSize: 14),
                    ),
                    Text(
                      '80 (2.00%)',
                      style: Styles.regulerStyle
                          .copyWith(fontSize: 12, color: Palletes.bullishColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInnerWidget(int index) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            final foldingCellState =
                context.findAncestorStateOfType<SimpleFoldingCellState>();
            foldingCellState?.toggleFold();
          },
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Buying',
                              style: Styles.regulerStyle.copyWith(fontSize: 12),
                            ),
                            Text(
                              '4100',
                              style: Styles.regulerStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Selling',
                              style: Styles.regulerStyle.copyWith(fontSize: 12),
                            ),
                            Text(
                              '4100',
                              style: Styles.regulerStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Stop Loss',
                              style: Styles.regulerStyle.copyWith(fontSize: 12),
                            ),
                            Text(
                              '4100',
                              style: Styles.regulerStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Targeted',
                              style: Styles.regulerStyle.copyWith(fontSize: 12),
                            ),
                            Text(
                              '4100',
                              style: Styles.regulerStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Predicted',
                              style: Styles.regulerStyle.copyWith(fontSize: 12),
                            ),
                            Text(
                              '4100',
                              style: Styles.regulerStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(color: Palletes.greyColor),
                  ),
                ],
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommendation',
                          style: Styles.regulerStyle.copyWith(fontSize: 12),
                        ),
                        Text(
                          'BUY (Uptrend)',
                          style: Styles.titleStyle.copyWith(
                              fontSize: 14, color: Palletes.bullishColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Open',
                                style:
                                    Styles.regulerStyle.copyWith(fontSize: 12),
                              ),
                              Text(
                                '4100',
                                style:
                                    Styles.regulerStyle.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Close',
                                style:
                                    Styles.regulerStyle.copyWith(fontSize: 12),
                              ),
                              Text(
                                '4100',
                                style:
                                    Styles.regulerStyle.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Prev. CLose',
                                style:
                                    Styles.regulerStyle.copyWith(fontSize: 12),
                              ),
                              Text(
                                '4100',
                                style:
                                    Styles.regulerStyle.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'High',
                                style:
                                    Styles.regulerStyle.copyWith(fontSize: 12),
                              ),
                              Text(
                                '4100',
                                style:
                                    Styles.regulerStyle.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Low',
                                style:
                                    Styles.regulerStyle.copyWith(fontSize: 12),
                              ),
                              Text(
                                '4100',
                                style:
                                    Styles.regulerStyle.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Volume',
                                style:
                                    Styles.regulerStyle.copyWith(fontSize: 12),
                              ),
                              Text(
                                '1K',
                                style:
                                    Styles.regulerStyle.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '*last updated:',
                      style: Styles.lightStyle.copyWith(fontSize: 8),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TopMoverWidget extends StatelessWidget {
  const TopMoverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Movers',
          style: Styles.titleStyle.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          child: ListView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: List.generate(20, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Palletes.bullishColor, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Palletes.secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              'BB',
                              style: Styles.titleStyle.copyWith(
                                  fontSize: 18, color: Palletes.whiteColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'XXXX',
                      style: Styles.titleStyle.copyWith(fontSize: 16),
                    ),
                    Row(
                      children: [
                        AppIcons.bullishIcon,
                        const SizedBox(width: 4),
                        Text(
                          '13.78%',
                          style: Styles.regulerStyle.copyWith(
                            fontSize: 12,
                            color: Palletes.bullishColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '*last updated:',
          style: Styles.lightStyle.copyWith(fontSize: 8),
        ),
      ],
    );
  }
}
