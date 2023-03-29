import 'package:rawg/src/app/features/home/data/models/genres_model.dart';
import 'package:rawg/src/app/features/home/domain/repositories/home_repo.dart';
import 'package:rawg/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase {
  final HomeRepository _homeRepository;

  HomeUseCase(this._homeRepository);

  Future<Either<Failure, GenresModel>> callGetGenres() async {
    return await _homeRepository.getGenresData();
  }

  Future<Either<Failure, Unit>> callLogOut() async {
    return await _homeRepository.userLogOut();
  }
}
