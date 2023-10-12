import 'package:flutter/material.dart';
import 'package:stock_app/core/constants/palletes.dart';

class SingleCandleWidget extends StatelessWidget {
  final double open;
  final double close;
  final double high;
  final double low;

  const SingleCandleWidget({
    Key? key,
    required this.open,
    required this.close,
    required this.high,
    required this.low,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isBearish = close < open;
    final bodyColor = isBearish ? Palletes.bearishColor : Palletes.bullishColor;
    final shadowColor = isBearish ? Palletes.bearishColor.withOpacity(.5) : Palletes.bullishColor.withOpacity(.5);
    final bodyHeight = (close - open).abs();
    final shadowHeight = high - low;

    return CustomPaint(
      painter: CandlePainter(
        bodyColor: bodyColor,
        shadowColor: shadowColor,
        bodyHeight: bodyHeight,
        shadowHeight: shadowHeight,
      ),
    );
  }
}

class CandlePainter extends CustomPainter {
  final Color bodyColor;
  final Color shadowColor;
  final double bodyHeight;
  final double shadowHeight;

  CandlePainter({
    required this.bodyColor,
    required this.shadowColor,
    required this.bodyHeight,
    required this.shadowHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final bodyWidth = size.width * 0.4;
    final bodyOffset = (size.width - bodyWidth) / 2;

    final bodyRect = Rect.fromLTRB(
      bodyOffset,
      size.height / 2 - bodyHeight / 2,
      bodyOffset + bodyWidth,
      size.height / 2 + bodyHeight / 2,
    );

    final shadowRect = Rect.fromLTRB(
      size.width / 2 - 1,
      size.height / 2 - shadowHeight / 2,
      size.width / 2 + 1,
      size.height / 2 + shadowHeight / 2,
    );

    final bodyPaint = Paint()..color = bodyColor;
    final shadowPaint = Paint()..color = shadowColor;

    canvas.drawRect(shadowRect, shadowPaint);
    canvas.drawRect(bodyRect, bodyPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
