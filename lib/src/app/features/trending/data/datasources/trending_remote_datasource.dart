import 'package:rawg/src/app/features/trending/data/models/trending_model.dart';

abstract class TrendingRemoteDataSource {
  Future<TrendingModel> getTrendingData(int pageToken);
}

class TrendingRemoteDataSourceImpl implements TrendingRemoteDataSource {
  @override
  Future<TrendingModel> getTrendingData(int pageToken) {
    // TODO: implement getTrendingData
    throw UnimplementedError();
  }
}
