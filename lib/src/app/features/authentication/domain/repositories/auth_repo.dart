import 'package:rawg/src/app/features/authentication/data/models/user_model.dart';
import 'package:rawg/src/app/features/authentication/domain/entities/user_entity.dart';
import 'package:rawg/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> createUser(UserEntity user);

  Future<Either<Failure, UserModel>> loginUser(
      String username, String password);

  Future<Either<Failure, Unit>> forgetPassword(String email, String password);
}
