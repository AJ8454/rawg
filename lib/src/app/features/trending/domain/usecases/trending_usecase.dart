import 'package:dartz/dartz.dart';
import 'package:rawg/src/app/features/trending/domain/entities/trending_entitie.dart';
import 'package:rawg/src/app/features/trending/domain/repositories/trending_repo.dart';
import 'package:rawg/src/core/errors/failures.dart';

class TrendingUseCase {
  TrendingRepository trendingRepository;

  TrendingUseCase({required this.trendingRepository});

  Future<Either<Failure, TrendingEntitie>> callGetTrendingData(
      int pageToken) async {
    return await trendingRepository.getTrendingData(pageToken);
  }
}
