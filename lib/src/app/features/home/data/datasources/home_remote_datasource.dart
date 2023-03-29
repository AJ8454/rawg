import 'package:http/http.dart' as http;

abstract class HomeRemoteDataSource {}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;
  HomeRemoteDataSourceImpl({required this.client});
}
