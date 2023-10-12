import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stock_app/core/constants/palletes.dart';

class SkeltonWidget extends StatelessWidget {
  final double width;
  const SkeltonWidget({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.dark
          ? Palletes.whiteColor
          : Palletes.blackColor.withOpacity(.2),
      highlightColor: Theme.of(context).brightness == Brightness.dark
          ? Palletes.blackColor.withOpacity(.1)
          : Palletes.whiteColor.withOpacity(.1),
      child: Container(color: Palletes.greyColor, height: 10, width: width),
    );
  }
}

class SkeltonListCardWidget extends StatelessWidget {
  const SkeltonListCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.dark
          ? Palletes.whiteColor
          : Palletes.blackColor.withOpacity(.2),
      highlightColor: Theme.of(context).brightness == Brightness.dark
          ? Palletes.blackColor.withOpacity(.1)
          : Palletes.whiteColor.withOpacity(.1),
      child: SizedBox(
        height: 100,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Container(
                width: 150,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Palletes.whiteColor.withOpacity(.2)
                          : Palletes.blackColor.withOpacity(.2)),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Palletes.greyColor,
                      height: 10,
                      width: 50,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      color: Palletes.greyColor,
                      height: 10,
                      width: 40,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      color: Palletes.greyColor,
                      height: 10,
                      width: 40,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class SkeltonListWidget extends StatelessWidget {
  final int length;
  const SkeltonListWidget({super.key, required this.length});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.dark
          ? Palletes.whiteColor
          : Palletes.blackColor.withOpacity(.2),
      highlightColor: Theme.of(context).brightness == Brightness.dark
          ? Palletes.blackColor.withOpacity(.1)
          : Palletes.whiteColor.withOpacity(.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(length, (index) {

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              border: Border(
                bottom: (index + 1 < length)
                    ? BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark
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
                        color:  Palletes.greyColor,
                        shape: BoxShape.circle,
                      ),
                    
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: size.width * .4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Container(
                      color: Palletes.greyColor,
                      height: 10,
                      width: 50,
                    ),
                            Container(
                      color: Palletes.greyColor,
                      height: 10,
                      width: 80,
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
                      Container(
                      color: Palletes.greyColor,
                      height: 10,
                      width: 40,
                    ),
                      Container(
                      color: Palletes.greyColor,
                      height: 10,
                      width: 60,
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class SkeltonAnalyze extends StatelessWidget {
  const SkeltonAnalyze({super.key});

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
                      baseColor: Theme.of(context).brightness == Brightness.dark
                          ? Palletes.whiteColor
                          : Palletes.blackColor.withOpacity(.2),
                      highlightColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? Palletes.blackColor.withOpacity(.1)
                              : Palletes.whiteColor.withOpacity(.1),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              color: Palletes.greyColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 10,
                                  width: 150,
                                  color: Palletes.greyColor,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 40,
                                          color: Palletes.greyColor,
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          height: 10,
                                          width: 30,
                                          color: Palletes.greyColor,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 40,
                                          color: Palletes.greyColor,
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          height: 10,
                                          width: 30,
                                          color: Palletes.greyColor,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 40,
                                          color: Palletes.greyColor,
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          height: 10,
                                          width: 30,
                                          color: Palletes.greyColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
  }
}
