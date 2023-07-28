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
  late List<Map<String, dynamic>> seasons = [];
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
