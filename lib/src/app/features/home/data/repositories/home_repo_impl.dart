import 'package:rawg/src/app/features/home/data/datasources/home_local_datasource.dart';
import 'package:rawg/src/app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:rawg/src/app/features/home/data/models/genres_model.dart';
import 'package:rawg/src/app/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:rawg/src/core/errors/failures.dart';
import 'package:rawg/src/core/network/network_info.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
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
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> userLogOut() async {
    try {
      await localDataSource.userLogOut();
      return right(unit);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
