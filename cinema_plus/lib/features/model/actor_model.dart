class ActorModel {
  final int? id;
  final String? name;
  final String? img;
  late String? character;
  late String? bio;
  late String? birthday;
  late String? deathday;
  late String? placeofBirth;
  late List<Map<String, dynamic>> movies = [];
  late List<Map<String, dynamic>> series = [];

  ActorModel({
    required this.id,
    required this.name,
    required this.img,
  });

  factory ActorModel.fromJson(Map jsonData) {
    String base500PosterUrl = "https://image.tmdb.org/t/p/w500";
    return ActorModel(
      id: jsonData["id"],
      name: jsonData["name"],
      img: base500PosterUrl + jsonData["profile_path"],
    );
  }
}
