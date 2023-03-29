import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:rawg/src/app/features/geners/data/models/genres_model.dart';
import 'package:rawg/src/core/helpers/database_helper.dart';
import 'package:rawg/src/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GenresLocalDataSource {
  Future<Unit> cacheGenre(GenresModel genresModel);
}

class GenresLocalDataSourceImpl implements GenresLocalDataSource {
  final DatabaseHelper databaseHelper;
  final SharedPreferences sharedPreference;

  GenresLocalDataSourceImpl(
      {required this.databaseHelper, required this.sharedPreference});

  @override
  Future<Unit> cacheGenre(GenresModel genresModel) async {
    final genresCacheData = json.encode(genresModel.toJson());
    await sharedPreference.setString(
        AppStrings.cacheGenresKey, genresCacheData);
    return Future.value(unit);
  }
}
