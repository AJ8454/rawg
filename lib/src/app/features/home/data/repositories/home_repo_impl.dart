import 'package:rawg/src/app/features/authentication/data/models/user_model.dart';
import 'package:rawg/src/app/features/home/data/datasources/home_local_datasource.dart';
import 'package:rawg/src/app/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:rawg/src/core/errors/failures.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, UserModel>> getUserData() async {
    try {
      final result = await localDataSource.getUserData();
      return right(result);
    } catch (e) {
      return left(ServerFailure());
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
