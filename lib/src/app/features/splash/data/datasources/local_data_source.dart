import 'dart:convert';

import 'package:rawg/src/app/features/authentication/data/models/user_model.dart';
import 'package:rawg/src/core/errors/exceptions.dart';
import 'package:rawg/src/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SplashLocalDataSource {
  Future<bool> getCachedUserLogged();
  Future<void> setCachedUserLogged(bool isLog);
  Future<UserModel> getCachedUser();
}

class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  final SharedPreferences sharedPreference;

  SplashLocalDataSourceImpl({required this.sharedPreference});

  @override
  Future<bool> getCachedUserLogged() async {
    final jsonBool = sharedPreference.getBool(AppStrings.cacheUserLoggedKey);
    if (jsonBool != null) {
      return (jsonBool);
    } else {
      return false;
    }
  }

  @override
  Future<void> setCachedUserLogged(bool isLog) async {
    await sharedPreference.setBool(AppStrings.cacheUserLoggedKey, isLog);
  }

  @override
  Future<UserModel> getCachedUser() async {
    final jsonString = sharedPreference.getString(AppStrings.cacheUserKey);
    if (jsonString != null) {
      UserModel userCacheModel = UserModel.fromJson(json.decode(jsonString));

      return Future.value(userCacheModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
