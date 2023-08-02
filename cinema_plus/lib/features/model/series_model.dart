import 'package:cinema_plus/features/model/actor_model.dart';

class SeriesModel {
  final int id;
  final String title;
  final String poster;
  final String releaseDate;
  final String language;
  final String overview;
  final double rating;
  final int totalVotes;
  final double popularity;
  final String backdrop;
  late String tagline;
  late List<dynamic> genres = [];
  late String status;
  late List<SeasonModel> seasons = [];
  late int totalEpisodes;
  late List<ActorModel> cast = [];

  SeriesModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.releaseDate,
    required this.language,
    required this.overview,
    required this.rating,
    required this.totalVotes,
    required this.popularity,
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
      rating: double.parse((jsonData["vote_average"]).toStringAsFixed(1)),
      totalVotes: jsonData["vote_count"],
      popularity: jsonData["popularity"],
      backdrop: baseOrgPosterUrl + jsonData["backdrop_path"],
    );
  }
}

class SeasonModel {
  final String? airDate;
  final int id;
  final String name;
  final String overview;
  final String poster;
  final int number;
  final double rating;
  final int episodeCount;
  late List<EpisodeModel> episodes;

  SeasonModel({
    required this.airDate,
    required this.id,
    required this.name,
    required this.overview,
    required this.poster,
    required this.number,
    required this.rating,
    required this.episodeCount,
  });

  factory SeasonModel.fromJson(Map jsonData) {
    String base500PosterUrl = "https://image.tmdb.org/t/p/w500";
    return SeasonModel(
      airDate: jsonData["air_date"],
      id: jsonData["id"],
      name: jsonData["name"],
      overview: jsonData["overview"],
      poster: base500PosterUrl + jsonData["poster_path"],
      number: jsonData["season_number"],
      rating: double.parse((jsonData["vote_average"]).toStringAsFixed(1)),
      episodeCount: jsonData["episodes"].length,
    );
  }
}

class EpisodeModel {
  final int number;
  final String airDate;
  final String name;
  final String overview;
  final int id;
  final int time;
  final String cover;
  final double rating;
  final int totalVotes;
  late List<ActorModel> actors;

  EpisodeModel({
    required this.number,
    required this.airDate,
    required this.name,
    required this.overview,
    required this.id,
    required this.time,
    required this.cover,
    required this.rating,
    required this.totalVotes,
  });

  factory EpisodeModel.fromJson(Map jsonData) {
    return EpisodeModel(
      number: jsonData["episode_number"],
      airDate: jsonData["air_date"],
      name: jsonData["name"],
      overview: jsonData["overview"],
      id: jsonData["id"],
      time: jsonData["runtime"],
      cover: jsonData["still_path"],
      rating: double.parse((jsonData["vote_average"]).toStringAsFixed(1)),
      totalVotes: jsonData["vote_count"],
    );
  }
}
