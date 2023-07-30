import 'package:cinema_plus/core/services/movie_service.dart';
import 'package:cinema_plus/core/services/series_service.dart';
import 'package:cinema_plus/core/utils/app_colors.dart';
import 'package:cinema_plus/features/model/movie_model.dart';
import 'package:cinema_plus/features/model/series_model.dart';
import 'package:cinema_plus/features/screens/movie_page.dart';
import 'package:cinema_plus/features/screens/series_page.dart';
import 'package:flutter/material.dart';

class GenrePage extends StatefulWidget {
  final Future<List<dynamic>> entites;
  final String title;
  const GenrePage({
    super.key,
    required this.entites,
    required this.title,
  });

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  int extraIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: AppColors.white, fontFamily: "REM"),
        ),
      ),
      backgroundColor: AppColors.primary,
      body: FutureBuilder(
          future: widget.entites,
          builder: (context, snapshot) {
            Widget result;
            if (snapshot.hasData) {
              List<dynamic> list = snapshot.data!;
              result = SizedBox(
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: ((context, index) {
                    return entitieGenreCard(context, list[index]);
                  }),
                ),
              );
            } else if (snapshot.hasError) {
              result = Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              result = const Center(
                child: CircularProgressIndicator(
                  color: AppColors.terinary,
                  strokeWidth: 1,
                ),
              );
            }
            return result;
          }),
    );
  }
}

Widget entitieGenreCard(context, dynamic entity) {
  return GestureDetector(
    onTap: () async {
      if (entity.runtimeType == MovieModel) {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => MoviePage(
                  movie: MovieService().getMovieDetails(entity.id),
                  title: entity.title,
                )),
          ),
        );
      } else if (entity.runtimeType == SeriesModel) {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => SeriesPage(
                  serie: SeriesService().getSeriesDetails(entity.id),
                  title: entity.title,
                )),
          ),
        );
      }
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 210,
      decoration: const BoxDecoration(
          color: AppColors.transperantOffWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(10),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: Image.network(
                    entity.poster,
                    width: 140,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                          ),
                        );
                      }
                    },
                    errorBuilder: (context, error, stackTrace) => const Center(
                        child: Icon(
                      Icons.warning,
                      color: AppColors.terinary,
                    )),
                  ),
                ),
              ),
              RotationTransition(
                turns: const AlwaysStoppedAnimation(15 / 360),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        size: 40,
                        color: AppColors.primary,
                      ),
                      const Icon(
                        Icons.star,
                        size: 35,
                        color: AppColors.terinary,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          entity.rating.toString(),
                          style: const TextStyle(
                              color: AppColors.white,
                              fontFamily: "REM",
                              fontSize: 8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 2, bottom: 5, right: 10, left: 10),
              child: Text(
                entity.title,
                softWrap: true,
                style: const TextStyle(
                  fontFamily: "REM",
                  fontSize: 16,
                  color: AppColors.terinary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
