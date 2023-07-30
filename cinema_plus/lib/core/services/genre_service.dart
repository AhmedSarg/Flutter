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
    print(url);
    late List<dynamic> result;
    late List<dynamic> genreEntities = [];
    final dio = Dio();
    await dio.get(url).then((value) {
      result = value.data["results"];
    });
    result.forEach((movie) {
      genreEntities.add(MovieModel.fromJson(movie));
    });
    print("check");
    genreEndpoint = "/tv";
    url = baseUrl + genreEndpoint + apiKey + query;
    await dio.get(url).then((value) {
      result = value.data["results"];
    });
    result.forEach((serie) {
      genreEntities.add(SeriesModel.fromJson(serie));
    });
    genreEntities.sort(((a, b) {
      return b.popularity.compareTo(a.popularity);
    }));
    return genreEntities;
  }
}
