import 'package:rawg/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, Unit>> userLogOut();
}
