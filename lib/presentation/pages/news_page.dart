import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stock_app/core/constants/images.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';
import 'package:stock_app/domain/entities/news.dart';
import 'package:stock_app/presentation/cubit/news_cubit.dart';
import 'package:stock_app/presentation/widgets/error_load_widget.dart';
import 'package:stock_app/presentation/widgets/tab_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late NewsCubit _newsCubit;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void onInit() {
    switch (_newsCubit.index) {
      case 1:
        _newsCubit.fetchGlobalNews(true);
        break;
      case 2:
        _newsCubit.fetchIndicesNews(true);
        break;
      case 0:
      default:
        _newsCubit.fetchLatestNews(true);
        break;
    }
  }

  void onLoad() {
    _newsCubit.page++;
    switch (_newsCubit.index) {
      case 1:
        _newsCubit.fetchGlobalNews(false);
        break;
      case 2:
        _newsCubit.fetchIndicesNews(false);
        break;
      case 0:
      default:
        _newsCubit.fetchLatestNews(false);
        break;
    }
  }

  @override
  void initState() {
    _newsCubit = context.read<NewsCubit>();
    onLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TabWidget(
        currentTab: _newsCubit.index,
        tabs: const ['Latest News', 'Global', 'Indices'],
        onTab: (int value) {
          _newsCubit.index = value;
          onInit();
        },
        main: Expanded(
          child: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: () {
              onInit();
              _refreshController.refreshCompleted();
            },
            onLoading: () {
              onLoad();
              _refreshController.loadComplete();
            },
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                BlocConsumer<NewsCubit, NewsState>(
                    bloc: _newsCubit,
                    listener: (context, state) {},
                    buildWhen: (previous, current) {
                      return (current is NewsLoading ||
                          current is NewsLoaded ||
                          current is NewsError);
                    },
                    builder: (context, state) {
                      if (state is NewsLoading && _newsCubit.news.isEmpty) {
                        return const LoadingHeadline();
                      }
                      if (state is NewsError || _newsCubit.news.isEmpty) {
                        return const SizedBox();
                      }
                      return HeadlineWidget(news: _newsCubit.news);
                    }),
                const SizedBox(height: 24),
                BlocConsumer<NewsCubit, NewsState>(
                    bloc: _newsCubit,
                    listener: (context, state) {},
                    buildWhen: (previous, current) {
                      return (current is NewsLoading ||
                          current is NewsLoaded ||
                          current is NewsError);
                    },
                    builder: (context, state) {
                      if (state is NewsLoading) {
                        return const LoadingNews();
                      }
                      if (state is NewsError) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 150.0),
                          child: ErrorLoadWidget(onReload: () => onInit()),
                        );
                      }
                      if (_newsCubit.news.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 150),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Images.newsImg,
                                width: 60,
                                height: 60,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Palletes.whiteColor
                                    : Palletes.blackColor,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No news found',
                                style: Styles.titleStyle,
                              )
                            ],
                          ),
                        );
                      }
                      return NewsWidget(news: _newsCubit.news);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
    required this.news,
  });

  final List<News> news;

  void _openUrl(String link) async {
    try {
      final Uri url = Uri.parse(link);
      await launchUrl(url);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(news.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => _openUrl(news[0].link),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news[index].title,
                        style: Styles.regulerStyle.copyWith(fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${news[index].category} | ${news[index].date}',
                        style: Styles.lightStyle.copyWith(fontSize: 12),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        news[index].description,
                        style: Styles.lightStyle.copyWith(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 80,
                    width: 80,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Palletes.lightColor),
                    child: SizedBox(
                      width: 30,
                      child: Image.asset(
                        Images.defaultImg,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class LoadingNews extends StatelessWidget {
  const LoadingNews({super.key});

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
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 10,
                          width: size.width,
                          color: Palletes.greyColor),
                      const SizedBox(height: 4),
                      Container(
                          height: 10,
                          width: size.width,
                          color: Palletes.greyColor),
                      const SizedBox(height: 4),
                      Container(
                          height: 10,
                          width: size.width,
                          color: Palletes.greyColor),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 80,
                    width: 80,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Palletes.greyColor),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class HeadlineWidget extends StatelessWidget {
  const HeadlineWidget({
    super.key,
    required this.news,
  });

  final List<News> news;

  void _openUrl(String link) async {
    try {
      final Uri url = Uri.parse(link);
      await launchUrl(url);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => _openUrl(news[0].link),
          child: SizedBox(
            child: Text(
              news[0].title,
              style: Styles.titleStyle.copyWith(fontSize: 18),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${news[0].category} | ${news[0].date}',
          style: Styles.lightStyle.copyWith(fontSize: 12),
        ),
        const SizedBox(height: 8),
        Container(
          height: 200,
          width: double.infinity,
          padding: const EdgeInsets.all(80),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Palletes.lightColor),
          child: SizedBox(
            width: 30,
            child: Image.asset(
              Images.defaultImg,
            ),
          ),
        ),
      ],
    );
  }
}

class LoadingHeadline extends StatelessWidget {
  const LoadingHeadline({super.key});

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
        children: [
          Container(height: 10, width: size.width, color: Palletes.greyColor),
          const SizedBox(height: 8),
          Container(height: 10, width: size.width, color: Palletes.greyColor),
          const SizedBox(height: 8),
          Container(
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.all(80),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Palletes.greyColor),
          ),
        ],
      ),
    );
  }
}
