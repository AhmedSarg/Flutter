class SeriesModel {
  final int id;
  final String title;
  final String poster;
  final String releaseDate;
  final String language;
  final String overview;
  final double rating;
  final int totalVotes;
  final String backdrop;
  late String tagline;
  late List<String> genres = [];
  late String status;
  late List<Season> seasons = [];
  late int totalEpisodes;
  late List<Map<String, dynamic>> cast = [];

  SeriesModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.releaseDate,
    required this.language,
    required this.overview,
    required this.rating,
    required this.totalVotes,
    required this.backdrop,
  });

  factory SeriesModel.fromJson(Map jsonData) {
    String base500PosterUrl = "https://image.tmdb.org/t/p/w500";
    String baseOrgPosterUrl = "https://image.tmdb.org/t/p/original";
    return SeriesModel(
      id: jsonData["id"],
      title: jsonData["name"],
      poster: base500PosterUrl + jsonData["poster_path"],
      releaseDate: jsonData["first_air_date"],
      language: jsonData["original_language"],
      overview: jsonData["overview"],
      rating: double.parse((jsonData["vote_average"]).toStringAsFixed(2)),
      totalVotes: jsonData["vote_count"],
      backdrop: baseOrgPosterUrl + jsonData["backdrop_path"],
    );
  }
}

class Season {
  final String airDate;
  final int id;
  final String name;
  final String overview;
  final String poster;
  final int number;
  final double rating;
  final int episodeCount;
  late List<Episode> episodes;

  Season({
    required this.airDate,
    required this.id,
    required this.name,
    required this.overview,
    required this.poster,
    required this.number,
    required this.rating,
    required this.episodeCount,
  });
}

class Episode {
  final int number;
  final String airDate;
  final String name;
  final String overview;
  final int id;
  final int time;
  final String cover;
  final double rating;

  Episode({
    required this.number,
    required this.airDate,
    required this.name,
    required this.overview,
    required this.id,
    required this.time,
    required this.cover,
    required this.rating,
  });
}
