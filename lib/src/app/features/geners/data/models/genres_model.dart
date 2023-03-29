import 'package:rawg/src/app/features/geners/domain/entities/genres_entities.dart';
import 'dart:convert';

GenresModel genresModelFromJson(String str) =>
    GenresModel.fromJson(json.decode(str));

class GenresModel extends GenresEntitie {
  const GenresModel({
    super.count,
    super.next,
    super.previous,
    required super.results,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<GenresDataModel>.from(
            json["results"].map((x) => GenresDataModel.fromJson(x))),
      );
}

class GenresDataModel extends GenresDataEntitie {
  const GenresDataModel({
    required super.id,
    required super.name,
    required super.games,
    required super.slug,
    required super.gamesCount,
    required super.imageBackground,
  });

  factory GenresDataModel.fromJson(Map<String, dynamic> json) =>
      GenresDataModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        games: List<GenresGameDataModel>.from(
            json["games"].map((x) => GenresGameDataModel.fromJson(x))),
      );
}

class GenresGameDataModel extends GenresGameDataEntitie {
  const GenresGameDataModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.added,
  });

  factory GenresGameDataModel.fromJson(Map<String, dynamic> json) =>
      GenresGameDataModel(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        added: json["added"],
      );
}
