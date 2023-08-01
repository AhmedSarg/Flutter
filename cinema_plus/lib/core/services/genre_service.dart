import 'package:cinema_plus/features/model/movie_model.dart';
import 'package:cinema_plus/features/model/series_model.dart';
import 'package:dio/dio.dart';

class GenreService {
  String baseUrl = "https://api.themoviedb.org/3/discover";
  String apiKey = "?api_key=044da023c2f912e4b5937f76528b4669";

  Future<List<dynamic>> getGenre(int genreId) async {
    String genreEndpoint = "/movie";
    String query = "&with_genres=$genreId";
    String url = baseUrl + genreEndpoint + apiKey + query;
    late List<dynamic> result;
    late List<dynamic> genreEntities = [];
    final dio = Dio();
    await dio.get(url).then((value) {
      result = value.data["results"];
    });
    result.forEach((movie) {
      genreEntities.add(MovieModel.fromJson(movie));
    });
    genreEndpoint = "/tv";
    url = baseUrl + genreEndpoint + apiKey + query;
    await dio.get(url).then((value) {
      result = value.data["results"];
    });
    result.forEach((serie) {
      if (serie["id"] != null &&
          serie["title"] != null &&
          serie["poster_path"] != null &&
          serie["first_air_date"] != null &&
          serie["original_language"] != null &&
          serie["overview"] != null &&
          serie["vote_average"] != null &&
          serie["vote_count"] != null &&
          serie["popularity"] != null &&
          serie["backdrop_path"] != null) {
        genreEntities.add(SeriesModel.fromJson(serie));
      }
    });
    genreEntities.sort(((a, b) {
      return b.popularity.compareTo(a.popularity);
    }));
    return genreEntities;
  }
}
