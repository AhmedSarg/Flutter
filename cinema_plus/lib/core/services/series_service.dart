import 'package:cinema_plus/features/model/actor_model.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:dio/dio.dart';

import '../../features/model/series_model.dart';

class SeriesService {
  String baseUrl = "https://api.themoviedb.org/3/";
  String apiKey = "?api_key=044da023c2f912e4b5937f76528b4669";

  Future<SeriesModel> getSeriesDetails(int serieId) async {
    late Map result;
    String imgBaseUrl = "https://image.tmdb.org/t/p/w200";
    String castEndpoint = "/credits";
    String seriesEndpoint = "tv/";
    String url = baseUrl + seriesEndpoint + serieId.toString() + apiKey;
    late SeriesModel serie;
    final dio = Dio();
    await dio.get(url).then((value) {
      result = value.data;
    });
    serie = SeriesModel.fromJson(result);
    serie.tagline = result["tagline"];
    serie.genres = result["genres"];
    serie.status = result["status"];
    serie.seasons.clear();
    result["seasons"].forEach((season) {
      if (season["season_number"] > 0) {
        serie.seasons.add(
          SeasonModel(
            airDate: season["air_date"],
            id: season["id"],
            name: season["name"],
            overview: season["overview"],
            poster: imgBaseUrl + season["poster_path"],
            number: season["season_number"],
            rating: season["vote_average"],
            episodeCount: season["episode_count"],
          ),
        );
      }
    });
    serie.totalEpisodes = result["number_of_episodes"];
    url =
        baseUrl + seriesEndpoint + serie.id.toString() + castEndpoint + apiKey;
    late List<dynamic> cast;
    await dio.get(url).then((value) {
      cast = value.data["cast"];
    });
    serie.cast.clear();
    cast.forEach((actor) {
      if (actor["name"] != null &&
          actor["character"] != null &&
          actor["profile_path"] != null) {
        ActorModel resActor = ActorModel.fromJson(actor);
        resActor.character = actor["character"];
        serie.cast.add(resActor);
      }
    });
    return serie;
  }

  Future<List<SeriesModel>> getGenreSeries(int genreId) async {
    String genreEndpoint = "discover/tv";
    String query = "&with_genres=$genreId";
    String url = baseUrl + genreEndpoint + apiKey + query;
    late List<dynamic> result;
    late List<SeriesModel> genreSeries = [];
    final dio = Dio();
    await dio.get(url).then((value) {
      result = value.data["results"];
    });
    result.forEach((serie) {
      genreSeries.add(SeriesModel.fromJson(serie));
    });
    genreSeries.sort(((a, b) {
      return b.rating.compareTo(a.rating);
    }));
    return genreSeries;
  }

  Future<SeasonModel> getSeasonDetails(int serieId, int seasonNumber) async {
    Map<String, dynamic> result = {};
    late SeasonModel season;
    String seriesEndpoint = "tv/";
    String seasonEndpoint = "/season/";
    String url = baseUrl +
        seriesEndpoint +
        serieId.toString() +
        seasonEndpoint +
        seasonNumber.toString() +
        apiKey;
    final dio = Dio();
    await dio.get(url).then((value) {
      result = value.data;
    });
    season = SeasonModel.fromJson(result);
    print("check");
    result["episodes"].forEach((episode) {
      print(episode);
      season.episodes.add(EpisodeModel.fromJson(episode));
      print("done");
    });
    print(season);
    return season;
  }

  Future<List<SeriesModel>> getPopular() async {
    String endpoint = "discover/tv";
    String query =
        "&vote_average.lte=10&vote_average.gte=8&with_original_language=en";
    String url = baseUrl + endpoint + apiKey + query;
    late List<dynamic> result;
    late List<SeriesModel> popularSeries = [];
    final dio = Dio();
    await dio.get(url).then((value) {
      result = value.data["results"];
    });
    result.forEach((series) {
      if (series["backdrop_path"] != null &&
          series["poster_path"] != null &&
          series["name"] != null &&
          series["first_air_date"] != null &&
          series["original_language"] != null &&
          series["overview"] != null &&
          series["vote_average"] != null &&
          series["vote_count"] != null) {
        SeriesModel seriesModel = SeriesModel.fromJson(series);
        popularSeries.add(seriesModel);
      }
    });
    popularSeries.sort(((a, b) {
      return b.rating.compareTo(a.rating);
    }));
    return popularSeries;
  }

  Future<List<SeriesModel>> getTopRated() async {
    String endpoint = "tv/top_rated";
    String url = baseUrl + endpoint + apiKey;
    late List<dynamic> result;
    late List<SeriesModel> topRatedSeries = [];
    final dio = Dio();
    await dio.get(url).then((value) {
      result = value.data["results"];
    });
    result.forEach((series) {
      if (series["backdrop_path"] != null &&
          series["poster_path"] != null &&
          series["name"] != null &&
          series["first_air_date"] != null &&
          series["original_language"] != null &&
          series["overview"] != null &&
          series["vote_average"] != null &&
          series["vote_count"] != null) {
        SeriesModel seriesModel = SeriesModel.fromJson(series);
        topRatedSeries.add(seriesModel);
      }
    });
    return topRatedSeries;
  }
}
