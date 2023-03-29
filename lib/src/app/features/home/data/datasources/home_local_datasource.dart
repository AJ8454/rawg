import 'package:rawg/src/app/features/authentication/data/models/user_model.dart';
import 'package:rawg/src/core/errors/failures.dart';
import 'package:rawg/src/core/helpers/database_helper.dart';
import 'package:rawg/src/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeLocalDataSource {
  Future<UserModel> getUserData();
  Future<void> userLogOut();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final DatabaseHelper databaseHelper;
  final SharedPreferences sharedPreference;

  HomeLocalDataSourceImpl(
      {required this.databaseHelper, required this.sharedPreference});

  @override
  Future<UserModel> getUserData() async {
    final db = await databaseHelper.database;
    print(sharedPreference.getInt(AppStrings.userPrefId));
    final maps = await db.query(
      AppStrings.authTable,
      columns: AuthDBFields.values,
      where: '${AuthDBFields.id} = ?',
      whereArgs: [sharedPreference.getInt(AppStrings.userPrefId)],
    );

    if (maps.isNotEmpty) {
      return UserModel.fromJson(maps.first);
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<void> userLogOut() async {
    await sharedPreference.clear();
  }
}
