import 'package:equatable/equatable.dart';
import 'package:rawg/src/app/features/geners/domain/entities/genres_entities.dart';

class TrendingEntitie extends Equatable {
  final int count;
  final String next;
  final String previous;
  final List<TrendingDataEntitie> results;

  const TrendingEntitie({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  @override
  List<Object?> get props => [count, next, previous, results];

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class TrendingDataEntitie extends Equatable {
  final int id;
  final String slug;
  final String name;
  final DateTime released;
  final bool tba;
  final String backgroundImage;
  final double rating;
  final int ratingTop;
  final List<RatingEntitie> ratings;
  final int ratingsCount;
  final int reviewsTextCount;
  final dynamic userGame;
  final int reviewsCount;
  final List<GenresDataEntitie> tags;
  final List<ShortScreenshotsEntitie> shortScreenshots;

  const TrendingDataEntitie({
    required this.id,
    required this.slug,
    required this.name,
    required this.released,
    required this.tba,
    required this.backgroundImage,
    required this.rating,
    required this.ratingTop,
    required this.ratings,
    required this.ratingsCount,
    required this.reviewsTextCount,
    required this.userGame,
    required this.reviewsCount,
    required this.tags,
    required this.shortScreenshots,
  });

  @override
  List<Object?> get props => [
        id,
        slug,
        name,
        released,
        tba,
        backgroundImage,
        rating,
        ratingTop,
        ratings,
        ratingsCount,
        reviewsTextCount,
        userGame,
        reviewsCount,
        tags,
        shortScreenshots,
      ];

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "released":
            "${released.year.toString().padLeft(4, '0')}-${released.month.toString().padLeft(2, '0')}-${released.day.toString().padLeft(2, '0')}",
        "tba": tba,
        "background_image": backgroundImage,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
        "ratings_count": ratingsCount,
        "reviews_text_count": reviewsTextCount,
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "short_screenshots":
            List<dynamic>.from(shortScreenshots.map((x) => x.toJson())),
      };
}

class RatingEntitie extends Equatable {
  final int id;
  final String title;
  final int count;
  final double percent;

  const RatingEntitie({
    required this.id,
    required this.title,
    required this.count,
    required this.percent,
  });

  @override
  List<Object?> get props => [id, title, count, percent];

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "count": count,
        "percent": percent,
      };
}

class ShortScreenshotsEntitie extends Equatable {
  final int id;
  final String image;

  const ShortScreenshotsEntitie({
    required this.id,
    required this.image,
  });

  @override
  List<Object?> get props => [id, image];

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
