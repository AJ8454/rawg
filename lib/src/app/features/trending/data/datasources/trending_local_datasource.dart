import 'package:rawg/src/app/features/trending/data/models/trending_model.dart';

abstract class TrendingLocalDataSource {
  Future<void> cacheTrendingData(TrendingModel trendingModel);
  Future<TrendingModel> getcacheTrendingData(int pageToken);
}

class TrendingLocalDataSourceImpl implements TrendingLocalDataSource {
  @override
  Future<TrendingModel> getcacheTrendingData(int pageToken) {
    // TODO: implement getTrendingData
    throw UnimplementedError();
  }

  @override
  Future<void> cacheTrendingData(TrendingModel trendingModel) {
    // TODO: implement cacheTrendingData
    throw UnimplementedError();
  }
}
