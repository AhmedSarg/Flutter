import 'package:dio/dio.dart';

import '../../features/model/movie_model.dart';

class MovieService {
  String baseUrl = "https://api.themoviedb.org/3/movie/";
  String apiKey = "?api_key=044da023c2f912e4b5937f76528b4669";

  Future<MovieModel> getMovie(int movieId) async {
    late Map result;
    late MovieModel movieModel;
    String url = baseUrl + movieId.toString() + apiKey;
    final dio = Dio();
    await dio.get(url).then((value) {
      result = value.data;
    });
    movieModel = MovieModel.fromJson(result);
    return movieModel;
  }

  Future<List<MovieModel>> getPopular() async {
    String endpoint = "popular";
    String url = baseUrl + endpoint + apiKey;
    late List<dynamic> result;
    late List<MovieModel> popularMovies = [];
    final dio = Dio();
    await dio.get(url).then((value) {
      result = value.data["results"];
    });
    result.forEach((movie) {
      MovieModel movieModel = MovieModel.fromJson(movie);
      popularMovies.add(movieModel);
    });
    return popularMovies;
  }

  Future<List<MovieModel>> getTopRated() async {
    String endpoint = "top_rated";
    String url = baseUrl + endpoint + apiKey;
    late List<dynamic> result;
    late List<MovieModel> topRatedMovies = [];
    final dio = Dio();
    await dio.get(url).then((value) {
      result = value.data["results"];
    });
    result.forEach((movie) {
      MovieModel movieModel = MovieModel.fromJson(movie);
      topRatedMovies.add(movieModel);
    });
    return topRatedMovies;
  }
}