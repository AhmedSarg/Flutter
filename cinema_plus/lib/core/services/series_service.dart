import 'package:dio/dio.dart';

import '../../features/model/series_model.dart';

class SeriesService {
  String baseUrl = "https://api.themoviedb.org/3/";
  String apiKey = "?api_key=044da023c2f912e4b5937f76528b4669";

  Future<SeriesModel> getSeries(int seriesId) async {
    late Map result;
    late SeriesModel seriesModel;
    String endpoint = "tv/$seriesId";
    String url = baseUrl + endpoint + apiKey;
    final dio = Dio();
    await dio.get(url).then((value) {
      result = value.data;
    });
    seriesModel = SeriesModel.fromJson(result);
    return seriesModel;
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
