import 'package:rawg/src/app/features/geners/data/models/genres_model.dart';
import 'package:rawg/src/app/features/trending/domain/entities/trending_entitie.dart';

class TrendingModel extends TrendingEntitie {
  const TrendingModel({
    required super.count,
    required super.next,
    required super.previous,
    required super.results,
  });

  factory TrendingModel.fromJson(Map<String, dynamic> json) => TrendingModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<TrendingDataModel>.from(
            json["results"].map((x) => TrendingDataModel.fromJson(x))),
      );
}

class TrendingDataModel extends TrendingDataEntitie {
  const TrendingDataModel({
    required super.id,
    required super.slug,
    required super.name,
    required super.released,
    required super.tba,
    required super.backgroundImage,
    required super.rating,
    required super.ratingTop,
    required super.ratings,
    required super.ratingsCount,
    required super.reviewsTextCount,
    required super.userGame,
    required super.reviewsCount,
    required super.tags,
    required super.shortScreenshots,
  });

  factory TrendingDataModel.fromJson(Map<String, dynamic> json) =>
      TrendingDataModel(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        released: DateTime.parse(json["released"]),
        tba: json["tba"],
        backgroundImage: json["background_image"],
        rating: json["rating"]?.toDouble(),
        ratingTop: json["rating_top"],
        ratings: List<RatingModel>.from(
            json["ratings"].map((x) => RatingModel.fromJson(x))),
        ratingsCount: json["ratings_count"],
        reviewsTextCount: json["reviews_text_count"],
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        tags: List<GenresDataModel>.from(
            json["tags"].map((x) => GenresDataModel.fromJson(x))),
        shortScreenshots: List<ShortScreenshotsModel>.from(
            json["short_screenshots"]
                .map((x) => ShortScreenshotsModel.fromJson(x))),
      );
}

class RatingModel extends RatingEntitie {
  const RatingModel({
    required super.id,
    required super.title,
    required super.count,
    required super.percent,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        id: json["id"],
        title: json["title"],
        count: json["count"],
        percent: json["percent"]?.toDouble(),
      );
}

class ShortScreenshotsModel extends ShortScreenshotsEntitie {
  const ShortScreenshotsModel({
    required super.id,
    required super.image,
  });

  factory ShortScreenshotsModel.fromJson(Map<String, dynamic> json) =>
      ShortScreenshotsModel(id: json["id"], image: json["image"]);
}
