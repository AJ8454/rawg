import 'package:rawg/src/app/features/splash/data/datasources/local_data_source.dart';
import 'package:rawg/src/app/features/splash/domain/repositories/splash_repo.dart';
import 'package:rawg/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashLocalDataSource splashLocalDataSource;

  SplashRepositoryImpl({required this.splashLocalDataSource});

  @override
  Future<bool> isUserLogged() async {
    final cacheData = await splashLocalDataSource.getCachedUserLogged();
    return cacheData;
  }

  @override
  Future<void> setUserLogged(bool value) async {
    await splashLocalDataSource.setCachedUserLogged(value);
  }

  @override
  Future<Either<Failure, Unit>> getUserCache() async {
    try {
      await splashLocalDataSource.getCachedUser();
      return const Right(unit);
    } catch (e) {
      return Left(EmptyCacheFailure());
    }
  }
}
