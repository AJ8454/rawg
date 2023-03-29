import 'package:rawg/src/app/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:rawg/src/app/features/authentication/data/models/user_model.dart';
import 'package:rawg/src/app/features/authentication/domain/entities/user_entity.dart';
import 'package:rawg/src/app/features/authentication/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:rawg/src/core/errors/failures.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, UserModel>> createUser(UserEntity user) async {
    try {
      UserModel userModel = UserModel(
          username: user.username,
          email: user.email,
          password: user.password,
          fName: user.fName,
          lName: user.lName,
          gender: user.gender,
          image: user.image,
          createdAt: user.createdAt);

      final result = await localDataSource.createUser(userModel);
      return right(result);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> loginUser(
      String username, String password) async {
    try {
      final result = await localDataSource.loginUser(username, password);
      return right(result);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> forgetPassword(
      String email, String password) async {
    try {
      await localDataSource.fogetPassword(email, password);
      return right(unit);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
