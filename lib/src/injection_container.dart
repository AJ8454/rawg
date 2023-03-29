import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rawg/src/app/features/geners/data/datasources/genres_local_datasource.dart';
import 'package:rawg/src/app/features/geners/data/datasources/genres_remote_datasource.dart';
import 'package:rawg/src/app/features/geners/data/repositories/genres_repo_impl.dart';
import 'package:rawg/src/app/features/geners/domain/repositories/genres_repo.dart';
import 'package:rawg/src/app/features/geners/domain/usecases/genres_usercase.dart';
import 'package:rawg/src/app/features/geners/presentation/bloc/genres_bloc.dart';
import 'package:rawg/src/app/features/home/presentation/cubit/bottom_nav_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rawg/src/app/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:rawg/src/app/features/authentication/data/repositories/auth_repo_impl.dart';
import 'package:rawg/src/app/features/authentication/domain/repositories/auth_repo.dart';
import 'package:rawg/src/app/features/authentication/domain/usecases/auth_usecase.dart';
import 'package:rawg/src/app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:rawg/src/app/features/home/data/datasources/home_local_datasource.dart';
import 'package:rawg/src/app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:rawg/src/app/features/home/data/repositories/home_repo_impl.dart';
import 'package:rawg/src/app/features/home/domain/repositories/home_repo.dart';
import 'package:rawg/src/app/features/home/domain/usecases/home_usecase.dart';
import 'package:rawg/src/app/features/splash/data/datasources/local_data_source.dart';
import 'package:rawg/src/app/features/splash/data/repositories/splash_repo_impl.dart';
import 'package:rawg/src/app/features/splash/domain/repositories/splash_repo.dart';
import 'package:rawg/src/app/features/splash/domain/usecases/splash_usecase.dart';
import 'package:rawg/src/app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:rawg/src/app/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:rawg/src/core/helpers/database_helper.dart';
import 'package:rawg/src/core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //---------- for Theme -----------------------------------------------
  sl.registerFactory(() => ThemeBloc());
  //---------- for Splash -----------------------------------------------

  // Bloc
  sl.registerFactory(() => SplashBloc(splashUsecase: sl()));
  // usecase
  sl.registerLazySingleton(() => SplashUsecase(sl()));
  // Reposiroty
  sl.registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImpl(splashLocalDataSource: sl()));
  // DataSources
  sl.registerLazySingleton<SplashLocalDataSource>(
      () => SplashLocalDataSourceImpl(sharedPreference: sl()));

  //---------- for Auth -----------------------------------------------

  // Bloc
  sl.registerFactory(() => AuthenticationBloc(authUsecase: sl()));
  // usecase
  sl.registerLazySingleton(() => AuthUsecase(sl()));
  // Reposiroty
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(localDataSource: sl()));
  // DataSources
  sl.registerLazySingleton<AuthLocalDataSource>(() =>
      AuthLocalDataSourceImpl(databaseHelper: sl(), sharedPreferences: sl()));

  //---------- for HOme -----------------------------------------------

  // Bloc
  sl.registerFactory(() => BottomNavCubit());
  // Bloc
  // sl.registerFactory(() => HomeBloc(genresUseCase: sl()));
  // usecase
  sl.registerLazySingleton(() => HomeUseCase(sl()));
  // Reposiroty
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
      localDataSource: sl(), networkInfo: sl(), remoteDataSource: sl()));
  // DataSources
  sl.registerLazySingleton<HomeLocalDataSource>(() =>
      HomeLocalDataSourceImpl(databaseHelper: sl(), sharedPreference: sl()));
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(client: sl()));

  //---------- for Genres -----------------------------------------------

  // Bloc
  sl.registerFactory(() => GenresBloc(genresUseCase: sl()));
  // usecase
  sl.registerLazySingleton(() => GenresUseCase(sl()));
  // Reposiroty
  sl.registerLazySingleton<GenresRepository>(() => GenresRepositoryImpl(
      localDataSource: sl(), networkInfo: sl(), remoteDataSource: sl()));
  // DataSources
  sl.registerLazySingleton<GenresLocalDataSource>(() =>
      GenresLocalDataSourceImpl(databaseHelper: sl(), sharedPreference: sl()));
  sl.registerLazySingleton<GenresRemoteDataSource>(
      () => GenresRemoteDataSourceImpl(client: sl()));

  //---------- for core -----------------------------------------------
  // core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//---------------------------------------------------------------------------
  // external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  final databaseHelper = DatabaseHelper.instance;
  sl.registerLazySingleton(() => databaseHelper);

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());

//---------------------------------------------------------------------------
}
