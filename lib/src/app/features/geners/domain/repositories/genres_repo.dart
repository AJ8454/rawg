import 'package:dartz/dartz.dart';
import 'package:rawg/src/app/features/geners/data/models/genres_model.dart';
import 'package:rawg/src/core/errors/failures.dart';

abstract class GenresRepository {
  Future<Either<Failure, GenresModel>> getGenresData();
}
