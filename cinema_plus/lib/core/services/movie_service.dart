import 'package:dio/dio.dart';

import '../../features/model/movie_model.dart';

class MovieService {
  String baseUrl = "https://api.themoviedb.org/3/movie/";
  String api_key = "?api_key=044da023c2f912e4b5937f76528b4669";
  final int movieId;
  late MovieModel movieModel;
  late Map result;

  MovieService({required this.movieId}) {
    baseUrl += movieId.toString() + api_key;
  }

  Future<MovieModel> getMovie() async {
    final dio = Dio();
    await dio.get(baseUrl).then((value) {
      result = value.data;
    });
    movieModel = MovieModel.fromJson(result);
    print(
        "id: ${movieModel.id}\ntitle: ${movieModel.title}\nposter: ${movieModel.poster}\nrelease date: ${movieModel.releaseDate}\nlanguage: ${movieModel.language}\noverview: ${movieModel.overview}\nrating: ${movieModel.rating}");
    return movieModel;
  }
}
