import 'package:dio/dio.dart';

import '../../features/model/actor_model.dart';

class ActorService {
  String baseUrl = "https://api.themoviedb.org/3/";
  String apiKey = "?api_key=044da023c2f912e4b5937f76528b4669";

  Future<ActorModel> getActorDetails(ActorModel actor) async {
    late Map result;
    String imgBaseUrl = "https://image.tmdb.org/t/p/w200";
    String actorEndpoint = "person/";
    String url = baseUrl + actorEndpoint + actor.id.toString() + apiKey;
    final dio = Dio();
    await dio.get(url).then((value) {
      result = value.data;
    });
    return actor;
  }
}
