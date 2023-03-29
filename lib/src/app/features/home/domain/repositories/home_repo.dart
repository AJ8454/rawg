import 'package:rawg/src/app/features/home/data/models/genres_model.dart';
import 'package:rawg/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, GenresModel>> getGenresData();
  Future<Either<Failure, Unit>> userLogOut();
}
