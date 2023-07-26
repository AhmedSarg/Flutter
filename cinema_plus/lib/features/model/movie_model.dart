class MovieModel {
  final int id;
  final String title;
  final String poster;
  final String releaseDate;
  final String language;
  final String overview;
  final String rating;

  MovieModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.releaseDate,
    required this.language,
    required this.overview,
    required this.rating,
  });

  factory MovieModel.fromJson(Map jsonData) {
    String basePosterUrl = "https://image.tmdb.org/t/p/w500";
    String errorHandle = ".0";
    return MovieModel(
      id: jsonData["id"],
      title: jsonData["title"],
      poster: basePosterUrl + jsonData["poster_path"],
      releaseDate: jsonData["release_date"],
      language: jsonData["original_language"],
      overview: jsonData["overview"],
      rating:
          (jsonData["vote_average"].toString() + errorHandle).substring(0, 3),
    );
  }
}
