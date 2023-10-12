import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stock_app/core/utils/config_util.dart';
import 'package:stock_app/core/utils/navigation_util.dart';
import 'package:stock_app/data/database/database.dart';
import 'package:stock_app/data/datasources/ask_local_data_source.dart';
import 'package:stock_app/data/datasources/crypto_remote_data_source.dart';
import 'package:stock_app/data/datasources/indices_remote_data_source.dart';
import 'package:stock_app/data/datasources/mutual_fund_remote_data_source.dart';
import 'package:stock_app/data/datasources/news_remote_data_source.dart';
import 'package:stock_app/data/datasources/stock_local_data_source.dart';
import 'package:stock_app/data/datasources/stock_remote_data_source.dart';
import 'package:stock_app/data/repositories/ask_repository_impl.dart';
import 'package:stock_app/data/repositories/crypto_repository_impl.dart';
import 'package:stock_app/data/repositories/market_repository_impl.dart';
import 'package:stock_app/data/repositories/mutual_fund_repository_impl.dart';
import 'package:stock_app/data/repositories/news_repository_impl.dart';
import 'package:stock_app/data/repositories/stock_repository_impl.dart';
import 'package:stock_app/domain/repositories/ask_repository.dart';
import 'package:stock_app/domain/repositories/crypto_repository.dart';
import 'package:stock_app/domain/repositories/market_repository.dart';
import 'package:stock_app/domain/repositories/mutual_fund_repository.dart';
import 'package:stock_app/domain/repositories/news_repository.dart';
import 'package:stock_app/domain/repositories/stock_repository.dart';
import 'package:stock_app/presentation/cubit/ask_cubit.dart';
import 'package:stock_app/presentation/cubit/indices_cubit.dart';
import 'package:stock_app/presentation/cubit/market_cubit.dart';
import 'package:stock_app/presentation/cubit/mutual_fund_cubit.dart';
import 'package:stock_app/presentation/cubit/news_cubit.dart';
import 'package:stock_app/presentation/cubit/stock_cubit.dart';
import 'package:stock_app/presentation/cubit/theme_cubit.dart';

final getIt = GetIt.instance;

void setupInjection() async {
  // Dio instance
  getIt.registerSingleton<Dio>(Dio());
    // Database
  getIt.registerSingleton<Database>(Database());

  // DataSource
  getIt.registerLazySingleton<StockRemoteDataSource>(
    () => StockRemoteDataSource(getIt<Dio>()),
  );
  getIt.registerLazySingleton<StockLocalDataSource>(
    () => StockLocalDataSource(getIt<Database>()),
  );
  getIt.registerLazySingleton<AskLocalDataSource>(
    () => AskLocalDataSource(getIt<Database>()),
  );
  getIt.registerLazySingleton<IndicesRemoteDataSource>(
    () => IndicesRemoteDataSource(getIt<Dio>()),
  );
  getIt.registerLazySingleton<CryptoRemoteDataSource>(
    () => CryptoRemoteDataSource(getIt<Dio>()),
  );
  getIt.registerLazySingleton<MutualFundRemoteDataSource>(
    () => MutualFundRemoteDataSource(getIt<Dio>()),
  );
   getIt.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSource(getIt<Dio>()),
  );

  // Repository
 getIt.registerLazySingleton<StockRepository>(
    () => StockRepositoryImpl(GetIt.instance<StockRemoteDataSource>(),
        getIt<StockLocalDataSource>()),
  );
  getIt.registerLazySingleton<AskRepository>(
    () => AskRepositoryImpl(getIt<AskLocalDataSource>()),
  );
  getIt.registerLazySingleton<MarketRepository>(
    () => MarketRepositoryImpl(getIt<IndicesRemoteDataSource>()),
  );
  getIt.registerLazySingleton<CryptoRepository>(
    () => CryptoRepositoryImpl(getIt<CryptoRemoteDataSource>()),
  );
  getIt.registerLazySingleton<MutualFundRepository>(
    () =>
        MutualFundRepositoryImpl(getIt<MutualFundRemoteDataSource>()),
  );
  getIt.registerLazySingleton<NewsRepository>(
    () =>
        NewsRepositoryImpl(getIt<NewsRemoteDataSource>()),
  );

  // Cubit
  getIt.registerFactory<StockCubit>(
    () => StockCubit(getIt<StockRepository>(), getIt<NewsRepository>()),
  );
  getIt.registerFactory<IndicesCubit>(
    () => IndicesCubit(getIt<MarketRepository>(), getIt<NewsRepository>()),
  );
  getIt.registerFactory<MarketCubit>(
    () => MarketCubit(getIt<MarketRepository>(), getIt<StockRepository>(),
        getIt<CryptoRepository>(), getIt<MutualFundRepository>()),
  );
  getIt.registerFactory<AskCubit>(
    () => AskCubit(getIt<AskRepository>()),
  );
  getIt.registerFactory<NewsCubit>(
    () => NewsCubit(getIt<NewsRepository>()),
  );
   getIt.registerFactory<MutualFundCubit>(
    () => MutualFundCubit(getIt<MutualFundRepository>()),
  );

  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  getIt.registerLazySingleton(() => NavigationUtil());
  getIt.registerLazySingleton(() => ConfigUtil(getIt<Database>()));
  
}
