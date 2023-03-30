import 'package:dartz/dartz.dart';
import 'package:rawg/src/app/features/geners/data/datasources/genres_local_datasource.dart';
import 'package:rawg/src/app/features/geners/data/datasources/genres_remote_datasource.dart';
import 'package:rawg/src/app/features/geners/data/models/genres_model.dart';
import 'package:rawg/src/app/features/geners/domain/repositories/genres_repo.dart';
import 'package:rawg/src/core/errors/exceptions.dart';
import 'package:rawg/src/core/errors/failures.dart';
import 'package:rawg/src/core/network/network_info.dart';

class GenresRepositoryImpl implements GenresRepository {
  final GenresLocalDataSource localDataSource;
  final GenresRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GenresRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, GenresModel>> getGenresData() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getGenresData();
        await localDataSource.cacheGenre(result);
        return Right(result);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final genresLocalData = await localDataSource.getcacheGenre();
        return Right(genresLocalData);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
