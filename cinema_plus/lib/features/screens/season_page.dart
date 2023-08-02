import 'package:cinema_plus/core/bloc/bio_cubit/bio_cubit.dart';
import 'package:cinema_plus/core/bloc/bio_cubit/bio_state.dart';
import 'package:cinema_plus/core/bloc/data_cubit/data_cubit.dart';
import 'package:cinema_plus/core/bloc/data_cubit/data_state.dart';
import 'package:cinema_plus/core/utils/app_colors.dart';
import 'package:cinema_plus/features/model/actor_model.dart';
import 'package:cinema_plus/features/model/series_model.dart';
import 'package:cinema_plus/features/screens/movie_page.dart';
import 'package:cinema_plus/features/screens/series_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SeasonPage extends StatefulWidget {
  final int serieId;
  final String seasonName;
  final int seasonNumber;
  const SeasonPage({
    super.key,
    required this.serieId,
    required this.seasonName,
    required this.seasonNumber,
  });

  @override
  State<SeasonPage> createState() => _SeasonPageState();
}

class _SeasonPageState extends State<SeasonPage> {
  @override
  Widget build(BuildContext context) {
    DataCubit cubit = BlocProvider.of<DataCubit>(context);
    cubit.getSeasonDetails(
        serieId: widget.serieId, seasonNumber: widget.seasonNumber);
    SeasonModel? season;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.seasonName,
          style: const TextStyle(color: AppColors.white, fontFamily: "REM"),
        ),
      ),
      backgroundColor: AppColors.primary,
      body: BlocBuilder<DataCubit, DataState>(builder: (context, state) {
        if (state is DataSuccess) {
          season ??= cubit.seasonPage;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 30, right: 20),
                            child: Container(
                              width: 110,
                              height: 165,
                              decoration: const BoxDecoration(
                                color: AppColors.terinary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(0.2),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.network(
                                    season!.poster,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              season!.name,
                              style: const TextStyle(
                                color: AppColors.offWhite,
                                fontFamily: "REM",
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 35,
                        ),
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
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: SizedBox(
                                height: 100,
                                child: Text(
                                  season!.overview,
                                  style: const TextStyle(
                                      color: AppColors.offWhite,
                                      fontSize: 14,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (state is DataFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Error: check internet connection",
                  style: TextStyle(
                    color: AppColors.offWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Montserrat",
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("retry"),
                )
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.terinary,
              strokeWidth: 1,
            ),
          );
        }
      }),
    );
  }
}

Widget movieCard(context, Map<String, dynamic> movie) {
  return GestureDetector(
    onTap: () async {
      await Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => MoviePage(
              movieId: movie["id"],
              title: movie["title"],
            )),
      ));
    },
    child: Container(
      margin: const EdgeInsets.only(left: 20, right: 10, top: 20, bottom: 20),
      width: 120,
      decoration: const BoxDecoration(
          color: AppColors.transperantOffWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Container(
              height: 180,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                  movie["poster"],
                  width: 400,
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
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2, right: 5, left: 5),
              child: Text(
                movie["title"],
                softWrap: true,
                style: const TextStyle(
                  fontFamily: "REM",
                  fontSize: 12,
                  color: AppColors.offWhite,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
              child: Text(
                movie["character"],
                softWrap: true,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 10,
                  color: AppColors.offWhite,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget serieCard(context, Map<String, dynamic> serie) {
  return GestureDetector(
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: ((context) => SeriesPage(
                serieId: serie["id"],
                title: serie["title"],
              )),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.only(left: 20, right: 10, top: 20, bottom: 20),
      width: 120,
      decoration: const BoxDecoration(
          color: AppColors.transperantOffWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Container(
              height: 180,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                  serie["poster"],
                  width: 400,
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
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2, right: 5, left: 5),
              child: Text(
                serie["title"],
                softWrap: true,
                style: const TextStyle(
                  fontFamily: "REM",
                  fontSize: 12,
                  color: AppColors.offWhite,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
              child: Text(
                serie["character"],
                softWrap: true,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 10,
                  color: AppColors.offWhite,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
