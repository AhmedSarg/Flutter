import 'package:cinema_plus/core/utils/app_colors.dart';
import 'package:cinema_plus/features/model/movie_model.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  final MovieModel movie;
  const MoviePage({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /*The Poster*/ Container(
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
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 10),
                  child: Container(
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
                          opacity: const AlwaysStoppedAnimation(0.9),
                          loadingBuilder: ((context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(color: AppColors.terinary),
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
