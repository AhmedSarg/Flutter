import 'dart:math';

import 'package:dio/dio.dart';

import '../../features/model/actor_model.dart';

class ActorService {
  String baseUrl = "https://api.themoviedb.org/3/";
  String apiKey = "?api_key=044da023c2f912e4b5937f76528b4669";

  Future<ActorModel> getActorDetails(int actorId) async {
    late Map result;
    String imgBaseUrl = "https://image.tmdb.org/t/p/w200";
    String actorEndpoint = "person/";
    String creditsEndpoint = "/combined_credits";
    late ActorModel actor;
    String url = baseUrl + actorEndpoint + actorId.toString() + apiKey;
    final dio = Dio();
    await dio.get(url).then((value) {
      result = value.data;
    });
    actor = ActorModel.fromJson(result);
    actor.bio = result["biography"];
    actor.birthday = result["birthday"];
    actor.deathday = result["deathday"];
    actor.placeofBirth = result["place_of_birth"];
    url = baseUrl +
        actorEndpoint +
        actor.id.toString() +
        creditsEndpoint +
        apiKey;
    List<dynamic> credits = [];
    await dio.get(url).then((value) {
      credits = value.data["cast"];
    });
    actor.movies.clear();
    actor.series.clear();
    credits.forEach((element) {
      if (element["poster_path"] != null) {
        if (element["media_type"] == "movie") {
          actor.movies.add(
            {
              "id": element["id"],
              "poster": imgBaseUrl + element["poster_path"],
              "title": element["title"],
              "character": element["character"],
              "popularity": element["popularity"],
              "type": element["media_type"],
            },
          );
        } else if (element["media_type"] == "tv") {
          actor.series.add(
            {
              "id": element["id"],
              "poster": imgBaseUrl + element["poster_path"],
              "title": element["name"],
              "character": element["character"],
              "popularity": element["popularity"],
              "type": element["media_type"],
            },
          );
        }
      }
    });
    actor.movies.sort(
      ((a, b) {
        return b["popularity"].compareTo(a["popularity"]);
      }),
    );
    actor.series.sort(
      ((a, b) {
        return b["popularity"].compareTo(a["popularity"]);
      }),
    );
    return actor;
  }
}
