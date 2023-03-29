import 'package:rawg/src/app/features/splash/domain/repositories/splash_repo.dart';
import 'package:rawg/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class SplashUsecase {
  final SplashRepository _splashRepository;

  SplashUsecase(this._splashRepository);

  Future<bool> call() async {
    return await _splashRepository.isUserLogged();
  }

  Future<void> setUserLog(bool isLog) async {
    return await _splashRepository.setUserLogged(isLog);
  }

  Future<Either<Failure, Unit>> callGetUserCache() async {
    return await _splashRepository.getUserCache();
  }
}
