import 'package:flutter/material.dart';
import 'package:stock_app/core/constants/images.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';

class ErrorPage extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const ErrorPage(this.errorDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.oopsImg,
              width: 80,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Palletes.whiteColor
                  : Palletes.blackColor,
            ),
            const SizedBox(height: 24),
            Text(
              'Something went wrong',
              style: Styles.titleStyle.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              '(error: ${errorDetails.context})',
              style: Styles.lightStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
