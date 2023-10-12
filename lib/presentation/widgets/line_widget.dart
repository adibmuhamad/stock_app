import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shimmer/shimmer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';
import 'package:stock_app/core/utils/date_util.dart';
import 'package:stock_app/core/utils/number_format_util.dart';
import 'package:stock_app/domain/entities/chart.dart';

class LineWidget extends StatelessWidget {
  final String name;
  final bool isLoading;
  final List<Chart> charts;

  const LineWidget({
    super.key,
    required this.charts,
    required this.isLoading,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: LineChart(
          mainData(),
          swapAnimationCurve: Curves.easeInOutCubic,
          swapAnimationDuration: const Duration(milliseconds: 1000),
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(show: false),
      gridData: FlGridData(
          show: false, horizontalInterval: 1.6, drawVerticalLine: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(),
        topTitles: AxisTitles(),
        leftTitles: AxisTitles(),
        bottomTitles: AxisTitles(),
      ),
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(
                color: Palletes.secondaryColor,
                strokeWidth: 2,
                dashArray: [3, 3],
              ),
              FlDotData(
                show: false,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 8,
                  color: [
                    Palletes.blackColor,
                    Palletes.blackColor,
                  ][index],
                  strokeWidth: 2,
                  strokeColor: Palletes.blackColor,
                ),
              ),
            );
          }).toList();
        },
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipPadding: const EdgeInsets.all(8),
          tooltipBgColor: Palletes.blackColor.withOpacity(0.8),
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return LineTooltipItem(
                '${DateUtil.chartFormat(touchedSpot.x)} : Rp.${NumberFormatUtil.formatDecimal(touchedSpot.y, decimalDigits: 4)}',
                Styles.lightStyle
                    .copyWith(color: Palletes.whiteColor, fontSize: 11),
              );
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
      ),
      lineBarsData: [
        LineChartBarData(
          spots: List<FlSpot>.generate(
              charts.length,
              (index) => FlSpot(
                  charts[index].x.millisecondsSinceEpoch.toDouble(),
                  charts[index].y)),
          isCurved: false,
          barWidth: 1,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                Palletes.secondaryColor.withOpacity(0.1),
                Palletes.secondaryColor.withOpacity(0.2),
                Palletes.secondaryColor.withOpacity(0.8),
              ],
            ),
          ),
          dotData: FlDotData(show: false),
          color: Palletes.secondaryColor,
        )
      ],
    );
  }
}
