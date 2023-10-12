import 'package:flutter/material.dart';
import 'package:stock_app/core/constants/images.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';

class ErrorLoadWidget extends StatelessWidget {
  final VoidCallback onReload;
  const ErrorLoadWidget({super.key, required this.onReload});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Images.oopsImg,
            width: 60,
            color: Theme.of(context).brightness == Brightness.dark
                ? Palletes.whiteColor
                : Palletes.blackColor,
          ),
          const SizedBox(height: 16),
          Text(
            'Something went wrong. Try again later!',
            style: Styles.regulerStyle.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onReload.call(),
            child: Container(
                padding: const EdgeInsets.all(8),
                color: Theme.of(context).brightness == Brightness.dark
                    ? Palletes.whiteColor
                    : Palletes.primaryColor,
                child: Text(
                  'Tap to refresh',
                  style: Styles.regulerStyle.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Palletes.blackColor
                          : Palletes.whiteColor,
                      fontSize: 12),
                )),
          ),
        ],
      ),
    );
  }
}
