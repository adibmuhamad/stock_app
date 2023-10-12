import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:stock_app/core/constants/app_icons.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';
import 'package:stock_app/injection_container.dart';
import 'package:stock_app/presentation/cubit/theme_cubit.dart';
import 'package:stock_app/presentation/pages/ask_page.dart';
import 'package:stock_app/presentation/pages/screener_page.dart';
import 'package:stock_app/presentation/widgets/custom_search_delegate.dart';
import 'market_page.dart';
import 'watchlist_page.dart';
import 'news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    MarketPage(),
    ScreenerPage(),
    WatchlistPage(),
    AskPage(),
    NewsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: AppIcons.marketIcon,
              title: Text(
                'Market',
                style: Styles.regulerStyle,
              ),
              selectedColor: Palletes.secondaryColor,
            ),
            SalomonBottomBarItem(
              icon: AppIcons.globeIcon,
              title: Text(
                'Screener',
                style: Styles.regulerStyle,
              ),
              selectedColor: Palletes.secondaryColor,
            ),
            SalomonBottomBarItem(
              icon: AppIcons.watchlistIcon,
              title: Text(
                'Watchlist',
                style: Styles.regulerStyle,
              ),
              selectedColor: Palletes.secondaryColor,
            ),
            SalomonBottomBarItem(
              icon: AppIcons.askIcon,
              title: Text(
                'Ask',
                style: Styles.regulerStyle,
              ),
              selectedColor: Palletes.secondaryColor,
            ),
            SalomonBottomBarItem(
              icon: AppIcons.newsIcon,
              title: Text(
                'News',
                style: Styles.regulerStyle,
              ),
              selectedColor: Palletes.secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = getIt<ThemeCubit>();

    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'MarketBull',
          style: Styles.titleStyle.copyWith(color: Palletes.secondaryColor),
        ),
      ),
      actions: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(
                color: Palletes.bearishColor,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'close',
              style: Styles.regulerStyle
                  .copyWith(fontSize: 12, color: Palletes.bearishColor),
            ),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SizedBox(
              child: AppIcons.searchIcon,
            ),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => themeCubit.toggleTheme(),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: SizedBox(
              child: Theme.of(context).brightness == Brightness.dark
                  ? AppIcons.darkIcon
                  : AppIcons.lightIcon,
            ),
          ),
        ),
      ],
      titleSpacing: 0,
      centerTitle: false,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size(50.0, 50.0);
}
