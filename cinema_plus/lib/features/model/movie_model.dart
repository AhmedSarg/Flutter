class MovieModel {
  final int id;
  final String title;
  final String poster;
  final String releaseDate;
  final String language;
  final String overview;
  final String rating;
  final String backDrop;

  MovieModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.releaseDate,
    required this.language,
    required this.overview,
    required this.rating,
    required this.backDrop,
  });

  factory MovieModel.fromJson(Map jsonData) {
    String base500PosterUrl = "https://image.tmdb.org/t/p/w500";
    String baseOrgPosterUrl = "https://image.tmdb.org/t/p/original";
    String errorHandle = ".0";
    return MovieModel(
      id: jsonData["id"],
      title: jsonData["title"],
      poster: base500PosterUrl + jsonData["poster_path"],
      releaseDate: jsonData["release_date"],
      language: jsonData["original_language"],
      overview: jsonData["overview"],
      rating:
          (jsonData["vote_average"].toString() + errorHandle).substring(0, 3),
      backDrop: baseOrgPosterUrl + jsonData["backdrop_path"],
    );
  }
}
