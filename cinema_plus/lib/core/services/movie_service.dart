import 'package:cinema_plus/features/model/actor_model.dart';
import 'package:dio/dio.dart';

import '../../features/model/movie_model.dart';

class MovieService {
  String baseUrl = "https://api.themoviedb.org/3/movie/";
  String apiKey = "?api_key=044da023c2f912e4b5937f76528b4669";

  Future<MovieModel> getMovieDetails(int movieId) async {
    late Map result;
    String url = baseUrl + movieId.toString() + apiKey;
    String imgBaseUrl = "https://image.tmdb.org/t/p/w200";
    String castEndpoint = "/credits";
    late MovieModel movie;
    final dio = Dio();
    await dio.get(url).then((value) {
      result = value.data;
    });
    movie = MovieModel.fromJson(result);
    movie.tagline = result["tagline"];
    result["genres"].forEach((genre) {
      movie.genres.add(genre["name"]);
    });
    movie.status = result["status"];
    int rev = result["revenue"];
    int lenRev = rev.toString().length;
    String sign = "";
    if (lenRev <= 3) {
      movie.revenue = rev.toString();
    } else if (lenRev >= 4 && lenRev <= 6) {
      sign = "K";
      movie.revenue = double.parse((rev.toDouble() / 1000.0).toStringAsFixed(2))
              .toString() +
          sign;
    } else if (lenRev >= 7 && lenRev <= 9) {
      sign = "M";
      movie.revenue =
          double.parse((rev.toDouble() / 1000000.0).toStringAsFixed(2))
                  .toString() +
              sign;
    } else {
      sign = "B";
      movie.revenue =
          double.parse((rev.toDouble() / 1000000000.0).toStringAsFixed(2))
                  .toString() +
              sign;
    }
    int budget = result["budget"];
    int lenBudg = budget.toString().length;
    sign = "";
    if (lenBudg <= 3) {
      movie.budget = budget.toString();
    } else if (lenBudg >= 4 && lenBudg <= 6) {
      sign = "K";
      movie.budget =
          double.parse((budget.toDouble() / 1000.0).toStringAsFixed(2))
                  .toString() +
              sign;
    } else if (lenBudg >= 7 && lenBudg <= 9) {
      sign = "M";
      movie.budget =
          double.parse((budget.toDouble() / 1000000.0).toStringAsFixed(2))
                  .toString() +
              sign;
    } else {
      sign = "B";
      movie.budget =
          double.parse((budget.toDouble() / 1000000000.0).toStringAsFixed(2))
                  .toString() +
              sign;
    }
    url = baseUrl + movie.id.toString() + castEndpoint + apiKey;
    late List<dynamic> cast;
    await dio.get(url).then((value) {
      cast = value.data["cast"];
    });
    movie.cast.clear();
    cast.forEach((actor) {
      if (actor["name"] != null &&
          actor["character"] != null &&
          actor["profile_path"] != null) {
        ActorModel resActor = ActorModel.fromJson(actor);
        resActor.character = actor["character"];
        movie.cast.add(resActor);
      }
    });
    return movie;
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
      if (movie["backdrop_path"] != null &&
          movie["poster_path"] != null &&
          movie["title"] != null &&
          movie["release_date"] != null &&
          movie["original_language"] != null &&
          movie["overview"] != null &&
          movie["vote_average"] != null &&
          movie["vote_count"] != null) {
        MovieModel movieModel = MovieModel.fromJson(movie);
        popularMovies.add(movieModel);
      }
    });
    popularMovies.sort(((a, b) {
      return b.rating.compareTo(a.rating);
    }));
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
      if (movie["backdrop_path"] != null &&
          movie["poster_path"] != null &&
          movie["title"] != null &&
          movie["release_date"] != null &&
          movie["original_language"] != null &&
          movie["overview"] != null &&
          movie["vote_average"] != null &&
          movie["vote_count"] != null) {
        MovieModel movieModel = MovieModel.fromJson(movie);
        topRatedMovies.add(movieModel);
      }
    });
    return topRatedMovies;
  }
}
