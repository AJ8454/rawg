import 'package:rawg/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SplashRepository {
  Future<bool> isUserLogged();

  Future<void> setUserLogged(bool value);

  Future<Either<Failure, Unit>> getUserCache();
}
