import 'package:dartz/dartz.dart';
import 'package:rawg/src/app/features/trending/domain/entities/trending_entitie.dart';
import 'package:rawg/src/core/errors/failures.dart';

abstract class TrendingRepository {
  Future<Either<Failure, TrendingEntitie>> getTrendingData(int pageToken);
}
