class ActorModel {
  final int? id;
  final String? name;
  final String? bio;
  final String? birthday;
  final String? deathday;
  final String? placeofBirth;
  final String? img;
  late Map<String, String> character = {};

  ActorModel({
    required this.id,
    required this.name,
    required this.bio,
    required this.birthday,
    required this.deathday,
    required this.placeofBirth,
    required this.img,
  });

  factory ActorModel.fromJson(Map jsonData) {
    String base500PosterUrl = "https://image.tmdb.org/t/p/w500";
    return ActorModel(
      id: jsonData["is"],
      name: jsonData["name"],
      bio: jsonData["biography"],
      birthday: jsonData["birthday"],
      deathday: jsonData["deathday"],
      placeofBirth: jsonData["place_of_birth"],
      img: base500PosterUrl + jsonData["profile_path"],
    );
  }
}
