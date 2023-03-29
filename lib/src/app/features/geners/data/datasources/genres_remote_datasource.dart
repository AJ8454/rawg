import 'package:http/http.dart' as http;

import 'package:rawg/src/app/features/geners/data/models/genres_model.dart';
import 'package:rawg/src/core/errors/exceptions.dart';
import 'package:rawg/src/core/evn.dart';
import 'package:rawg/src/core/utils/app_strings.dart';

abstract class GenresRemoteDataSource {
  Future<GenresModel> getGenresData();
}

class GenresRemoteDataSourceImpl implements GenresRemoteDataSource {
  final http.Client client;
  GenresRemoteDataSourceImpl({required this.client});

  @override
  Future<GenresModel> getGenresData() async {
    String endPoint = "api/genres?key=${AppStrings.apiKey}";

    final response = await client.get(
      Uri.parse("${AppEnvironment.baseApiUrl}$endPoint"),
    );

    if (response.statusCode == 200) {
      GenresModel genresModel = genresModelFromJson(response.body);
      return genresModel;
    } else {
      throw ServerException();
    }
  }
}
