import 'package:cinema_plus/core/utils/app_colors.dart';
import 'package:cinema_plus/features/model/movie_model.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  final MovieModel movie;
  const MoviePage({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            movie.title,
            style: const TextStyle(
              color: AppColors.white,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 202.7,
              color: AppColors.primary,
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: Image.network(
                        movie.backDrop,
                        width: 360,
                        height: 202.7,
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 10),
                      child: Container(
                        width: 110,
                        height: 165,
                        decoration: const BoxDecoration(
                          color: AppColors.terinary,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0.2),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              movie.poster,
                              width: 110,
                              loadingBuilder:
                                  ((context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.offWhite,
                                      strokeWidth: 1,
                                    ),
                                  );
                                }
                              }),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: AppColors.primary,
                  width: double.infinity,
                  height: 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                              color: AppColors.offWhite,
                              fontSize: 18,
                              fontFamily: "REM",
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 50),
                        child: Text(
                          "Overview",
                          style: TextStyle(
                              color: AppColors.offWhite,
                              fontSize: 18,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Text(
                          movie.overview,
                          style: const TextStyle(
                              color: AppColors.offWhite,
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
