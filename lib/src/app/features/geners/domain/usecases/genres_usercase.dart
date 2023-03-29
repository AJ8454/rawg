import 'package:dartz/dartz.dart';
import 'package:rawg/src/app/features/geners/data/models/genres_model.dart';
import 'package:rawg/src/app/features/geners/domain/repositories/genres_repo.dart';
import 'package:rawg/src/core/errors/failures.dart';

class GenresUseCase {
  final GenresRepository _genresRepository;

  GenresUseCase(this._genresRepository);

  Future<Either<Failure, GenresModel>> callGetGenres() async {
    return await _genresRepository.getGenresData();
  }
}
