import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';
import 'package:stock_app/core/utils/number_format_util.dart';
import 'package:stock_app/domain/entities/quote.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({
    super.key,
    required this.quote,
    this.decimal = 0,
  });

  final Quote quote;
  final int? decimal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    'Open',
                    style: Styles.lightStyle.copyWith(fontSize: 12),
                  ),
                  Text(
                    NumberFormatUtil.formatDecimal(quote.open ?? 0,
                        decimalDigits: decimal!),
                    style: Styles.titleStyle.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    'Close',
                    style: Styles.lightStyle.copyWith(fontSize: 12),
                  ),
                  Text(
                    NumberFormatUtil.formatDecimal(quote.close ?? 0,
                        decimalDigits: decimal!),
                    style: Styles.titleStyle.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    'Prev. Close',
                    style: Styles.lightStyle.copyWith(fontSize: 12),
                  ),
                  Text(
                    NumberFormatUtil.formatDecimal(quote.prevClose ?? 0,
                        decimalDigits: decimal!),
                    style: Styles.titleStyle.copyWith(fontSize: 14),
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
              child: Column(
                children: [
                  Text(
                    'High',
                    style: Styles.lightStyle.copyWith(fontSize: 12),
                  ),
                  Text(
                    NumberFormatUtil.formatDecimal(quote.high ?? 0,
                        decimalDigits: decimal!),
                    style: Styles.titleStyle
                        .copyWith(fontSize: 14, color: Palletes.bullishColor),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    'Low',
                    style: Styles.lightStyle.copyWith(fontSize: 12),
                  ),
                  Text(
                    NumberFormatUtil.formatDecimal(quote.low ?? 0,
                        decimalDigits: decimal!),
                    style: Styles.titleStyle
                        .copyWith(fontSize: 14, color: Palletes.bearishColor),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    'Volume',
                    style: Styles.lightStyle.copyWith(fontSize: 12),
                  ),
                  Text(
                    NumberFormatUtil.formatCompact(quote.volume ?? 0,
                        decimalDigits: decimal!),
                    style: Styles.titleStyle.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class QuoteLoadingWidget extends StatelessWidget {
  const QuoteLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.dark
          ? Palletes.whiteColor
          : Palletes.blackColor.withOpacity(.2),
      highlightColor: Theme.of(context).brightness == Brightness.dark
          ? Palletes.blackColor.withOpacity(.1)
          : Palletes.whiteColor.withOpacity(.1),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      'Open',
                      style: Styles.lightStyle.copyWith(fontSize: 12),
                    ),
                    Container(color: Palletes.greyColor, height: 10, width: 40,)
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      'Close',
                      style: Styles.lightStyle.copyWith(fontSize: 12),
                    ),
                     Container(color: Palletes.greyColor, height: 10, width: 40,)
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      'Prev. Close',
                      style: Styles.lightStyle.copyWith(fontSize: 12),
                    ),
                      Container(color: Palletes.greyColor, height: 10, width: 40,)
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
                child: Column(
                  children: [
                    Text(
                      'High',
                      style: Styles.lightStyle.copyWith(fontSize: 12),
                    ),
                      Container(color: Palletes.greyColor, height: 10, width: 40,)
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      'Low',
                      style: Styles.lightStyle.copyWith(fontSize: 12),
                    ),
                     Container(color: Palletes.greyColor, height: 10, width: 40,)
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      'Volume',
                      style: Styles.lightStyle.copyWith(fontSize: 12),
                    ),
                      Container(color: Palletes.greyColor, height: 10, width: 40,)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
