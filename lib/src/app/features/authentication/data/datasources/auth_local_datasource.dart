import 'package:rawg/src/app/features/authentication/data/models/user_model.dart';
import 'package:rawg/src/core/errors/failures.dart';
import 'package:rawg/src/core/helpers/database_helper.dart';
import 'package:rawg/src/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

abstract class AuthLocalDataSource {
  Future<UserModel> createUser(UserModel user);
  Future<UserModel> loginUser(String username, String password);
  Future<void> fogetPassword(String email, String password);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final DatabaseHelper databaseHelper;
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl(
      {required this.databaseHelper, required this.sharedPreferences});

  @override
  Future<UserModel> createUser(UserModel user) async {
    Database db = await databaseHelper.database;
    final id = await db.insert(AppStrings.authTable, user.toJson());
    print("user Created $id");
    sharedPreferences.setInt(AppStrings.userPrefId, id);
    return user.copyWith(id: id);
  }

  @override
  Future<UserModel> loginUser(String username, String password) async {
    Database db = await databaseHelper.database;
    final maps = await db.query(
      AppStrings.authTable,
      columns: AuthDBFields.values,
      where: '${AuthDBFields.userName} = ? and ${AuthDBFields.password} = ?',
      whereArgs: [username, password],
    );

    if (maps.isNotEmpty) {
      final user = UserModel.fromJson(maps.first);
      await sharedPreferences.setInt(AppStrings.userPrefId, user.id!);
      await sharedPreferences.setBool(AppStrings.cacheUserLoggedKey, true);
      return user;
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<void> fogetPassword(String email, String password) async {
    Database db = await databaseHelper.database;
    final maps = await db.rawUpdate('''
    UPDATE ${AppStrings.authTable} 
    SET ${AuthDBFields.password} = ? 
    WHERE ${AuthDBFields.email} = ?
    ''', [password, email]);
    print(maps);
  }

  // Future<UserModel> readUser(int id) async {
  //   final db = await instance.database;

  //   final maps = await db.query(
  //     AppStrings.authTable,
  //     columns: AuthDBFields.values,
  //     where: '${AuthDBFields.id} = ?',
  //     whereArgs: [id],
  //   );

  //   if (maps.isNotEmpty) {
  //     return UserModel.fromJson(maps.first);
  //   } else {
  //     throw ServerFailure();
  //   }
  // }

  // Future<List<UserModel>> readAllUsers() async {
  //   final db = await instance.database;
  //   const orderBy = '${AuthDBFields.createdAt} ASC';
  //   final result = await db.query(AppStrings.authTable, orderBy: orderBy);
  //   return result.map((json) => UserModel.fromJson(json)).toList();
  // }

  // Future<int> updateUser(UserModel user) async {
  //   final db = await instance.database;
  // return db.update(
  //   AppStrings.authTable,
  //   user.toJson(),
  //   where: '${AuthDBFields.id} = ?',
  //   whereArgs: [user.id],
  // );
  // }

  // Future<int> deleteUser(int id) async {
  //   final db = await instance.database;
  //   return await db.delete(
  //     AppStrings.authTable,
  //     where: '${AuthDBFields.id} = ?',
  //     whereArgs: [id],
  //   );
  // }
}
