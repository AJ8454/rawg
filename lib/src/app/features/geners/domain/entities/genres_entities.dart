import 'package:equatable/equatable.dart';

class GenresEntitie extends Equatable {
  final int? count;
  final int? next;
  final int? previous;
  final List<GenresDataEntitie> results;

  const GenresEntitie({
    this.count,
    this.next,
    this.previous,
    required this.results,
  });

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [count, next, previous, results];
}

class GenresDataEntitie extends Equatable {
  final int id;
  final String name;
  final String slug;
  final int gamesCount;
  final String imageBackground;
  final List<GenresGameDataEntitie> games;

  const GenresDataEntitie({
    required this.id,
    required this.name,
    required this.slug,
    required this.gamesCount,
    required this.imageBackground,
    required this.games,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "games": List<dynamic>.from(games.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props =>
      [id, name, slug, gamesCount, imageBackground, games];
}

class GenresGameDataEntitie extends Equatable {
  final int id;
  final String slug;
  final String name;
  final int added;

  const GenresGameDataEntitie({
    required this.id,
    required this.slug,
    required this.name,
    required this.added,
  });

  Map<String, dynamic> toJson() =>
      {"id": id, "slug": slug, "name": name, "added": added};

  @override
  List<Object?> get props => [id, slug, name, added];
}
