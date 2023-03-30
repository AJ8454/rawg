import 'package:rawg/src/app/features/trending/data/datasources/trending_local_datasource.dart';
import 'package:rawg/src/app/features/trending/data/datasources/trending_remote_datasource.dart';
import 'package:rawg/src/app/features/trending/data/models/trending_model.dart';
import 'package:dartz/dartz.dart';
import 'package:rawg/src/app/features/trending/domain/repositories/trending_repo.dart';
import 'package:rawg/src/core/errors/exceptions.dart';
import 'package:rawg/src/core/errors/failures.dart';
import 'package:rawg/src/core/network/network_info.dart';

class TrendingRepositoryImpl implements TrendingRepository {
  final TrendingLocalDataSource localDataSource;
  final TrendingRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  TrendingRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, TrendingModel>> getTrendingData(int pageToken) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getTrendingData(pageToken);
        await localDataSource.cacheTrendingData(result);
        return Right(result);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final genresLocalData =
            await localDataSource.getcacheTrendingData(pageToken);
        return Right(genresLocalData);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
