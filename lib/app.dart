import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/core/themes.dart';
import 'package:stock_app/core/utils/navigation_util.dart';
import 'package:stock_app/env/env.dart';
import 'package:stock_app/injection_container.dart';
import 'package:stock_app/presentation/cubit/ask_cubit.dart';
import 'package:stock_app/presentation/cubit/indices_cubit.dart';
import 'package:stock_app/presentation/cubit/market_cubit.dart';
import 'package:stock_app/presentation/cubit/mutual_fund_cubit.dart';
import 'package:stock_app/presentation/cubit/news_cubit.dart';
import 'package:stock_app/presentation/cubit/stock_cubit.dart';
import 'package:stock_app/presentation/cubit/theme_cubit.dart';
import 'package:stock_app/presentation/pages/error_page.dart';
import 'package:stock_app/presentation/pages/home_page.dart';
import 'package:stock_app/presentation/pages/indices_detail_page.dart';
import 'package:stock_app/presentation/pages/mutual_fund_detail_page.dart';
import 'package:stock_app/presentation/pages/quote_detail_page.dart';
import 'package:stock_app/presentation/pages/stock_detail_page.dart';
import 'package:stock_app/presentation/pages/tradingview_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => getIt<ThemeCubit>(),
        ),
        BlocProvider<MarketCubit>(
          create: (BuildContext context) => getIt<MarketCubit>(),
        ),
        BlocProvider<AskCubit>(
          create: (BuildContext context) => getIt<AskCubit>(),
        ),
        BlocProvider<NewsCubit>(
          create: (BuildContext context) => getIt<NewsCubit>(),
        ),
        BlocProvider<StockCubit>(
          create: (BuildContext context) => getIt<StockCubit>(),
        ),
        BlocProvider<IndicesCubit>(
          create: (BuildContext context) => getIt<IndicesCubit>(),
        ),
         BlocProvider<MutualFundCubit>(
          create: (BuildContext context) => getIt<MutualFundCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeModeOption>(
          builder: (context, themeMode) {
        return MaterialApp(
          title: Env.appName,
          debugShowCheckedModeBanner: Env().isDev,
          theme: Themes().lightTheme,
          darkTheme: Themes().darkTheme,
          themeMode: themeMode == ThemeModeOption.dark
              ? ThemeMode.dark
              : ThemeMode.light,
          initialRoute: 'Home',
          onGenerateRoute: generateRoute,
          navigatorKey: getIt<NavigationUtil>().navigatorKey,
        );
      }),
    );
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'Home':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case 'StockDetail':
        return MaterialPageRoute(
            builder: (context) =>
                StockDetailPage(data: settings.arguments as Map));
      case 'IndicesDetail':
        return MaterialPageRoute(
            builder: (context) =>
                IndicesDetailPage(data: settings.arguments as Map));
      case 'QuoteDetail':
        return MaterialPageRoute(
            builder: (context) =>
                QuoteDetailPage(data: settings.arguments as Map));
      case 'MutualFundDetail':
        return MaterialPageRoute(
            builder: (context) =>
                MutualFundDetailPage(data: settings.arguments as Map));
      case 'TradingView':
        return MaterialPageRoute(
            builder: (context) =>
                TradingviewPage(data: settings.arguments as Map));

      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}

class ErrorApp extends StatelessWidget {
  final Object error;
  final StackTrace stackTrace;

  const ErrorApp(this.error, this.stackTrace, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Env.appName,
      debugShowCheckedModeBanner: Env().isDev,
      home: ErrorPage(
        FlutterErrorDetails(exception: error, stack: stackTrace),
      ),
    );
  }
}
