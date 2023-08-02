import 'package:cinema_plus/core/bloc/bio_cubit/bio_cubit.dart';
import 'package:cinema_plus/core/bloc/data_cubit/data_cubit.dart';
import 'package:cinema_plus/core/bloc/data_cubit/data_state.dart';
import 'package:cinema_plus/core/utils/app_colors.dart';
import 'package:cinema_plus/features/model/actor_model.dart';
import 'package:cinema_plus/features/model/series_model.dart';
import 'package:cinema_plus/features/screens/actor_page.dart';
import 'package:cinema_plus/features/screens/genre_page.dart';
import 'package:cinema_plus/features/screens/season_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriesPage extends StatefulWidget {
  final int serieId;
  final String title;
  const SeriesPage({
    super.key,
    required this.serieId,
    required this.title,
  });

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  @override
  Widget build(BuildContext context) {
    DataCubit cubit = BlocProvider.of<DataCubit>(context);
    cubit.getSerieDetails(serieId: widget.serieId);
    SeriesModel? serie;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: AppColors.white, fontFamily: "REM"),
        ),
      ),
      backgroundColor: AppColors.primary,
      body: BlocBuilder<DataCubit, DataState>(
        builder: ((context, state) {
          if (state is DataSuccess) {
            serie ??= cubit.seriePage;
            return Column(
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: Image.network(
                            serie!.backdrop,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(0.2),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.network(
                                  serie!.poster,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 15,
                            bottom: 5,
                          ),
                          child: Text(
                            serie!.title,
                            style: const TextStyle(
                                color: AppColors.offWhite,
                                fontSize: 18,
                                fontFamily: "REM",
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Text(
                            serie!.tagline,
                            style: const TextStyle(
                                color: AppColors.offWhite,
                                fontSize: 10,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
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
                              left: 15, right: 15, top: 10, bottom: 15),
                          child: Text(
                            serie!.overview,
                            style: const TextStyle(
                                color: AppColors.offWhite,
                                fontSize: 14,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 35,
                          ),
                          child: Text(
                            "Rating",
                            style: TextStyle(
                                color: AppColors.offWhite,
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 15),
                          child: Row(
                            children: [
                              Text(
                                serie!.rating.toString(),
                                style: const TextStyle(
                                  color: AppColors.terinary,
                                  fontSize: 20,
                                  fontFamily: "REM",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Text(
                                " of total ",
                                style: TextStyle(
                                  color: AppColors.offWhite,
                                  fontSize: 18,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                serie!.totalVotes.toString(),
                                style: const TextStyle(
                                  color: AppColors.terinary,
                                  fontSize: 20,
                                  fontFamily: "REM",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Text(
                                " Votes",
                                style: TextStyle(
                                  color: AppColors.offWhite,
                                  fontSize: 18,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 35,
                          ),
                          child: Text(
                            "Genres",
                            style: TextStyle(
                              color: AppColors.offWhite,
                              fontSize: 18,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          height: 50,
                          width: double.infinity,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: ((context) => GenrePage(
                                              genreId: serie!.genres[index]
                                                  ["id"],
                                              title: serie!.genres[index]
                                                  ["name"],
                                            )),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    serie!.genres[index]["name"],
                                    style: const TextStyle(
                                      color: AppColors.offWhite,
                                      fontSize: 10,
                                      fontFamily: "REM",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            }),
                            separatorBuilder: ((context, index) {
                              return const Divider();
                            }),
                            itemCount: serie!.genres.length,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 35,
                          ),
                          child: Text(
                            "Details",
                            style: TextStyle(
                                color: AppColors.offWhite,
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Status :  ",
                                      style: TextStyle(
                                        color: AppColors.offWhite,
                                        fontSize: 14,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      serie!.status,
                                      style: const TextStyle(
                                        color: AppColors.terinary,
                                        fontSize: 16,
                                        fontFamily: "REM",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Release Date :  ",
                                      style: TextStyle(
                                        color: AppColors.offWhite,
                                        fontSize: 14,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      serie!.releaseDate,
                                      style: const TextStyle(
                                        color: AppColors.terinary,
                                        fontSize: 16,
                                        fontFamily: "REM",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Language :  ",
                                      style: TextStyle(
                                        color: AppColors.offWhite,
                                        fontSize: 14,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      serie!.language,
                                      style: const TextStyle(
                                        color: AppColors.terinary,
                                        fontSize: 16,
                                        fontFamily: "REM",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 35,
                          ),
                          child: Text(
                            "Cast",
                            style: TextStyle(
                                color: AppColors.offWhite,
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        SizedBox(
                          height: 290,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return actorCard(
                                context,
                                serie!.cast[index],
                                widget.title,
                              );
                            }),
                            separatorBuilder: ((context, index) =>
                                const Divider()),
                            itemCount: serie!.cast.length,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 35,
                          ),
                          child: Text(
                            "Seasons",
                            style: TextStyle(
                                color: AppColors.offWhite,
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        SizedBox(
                          height: 290,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return seasonCard(
                                context,
                                serie!.seasons[index],
                                widget.serieId,
                              );
                            }),
                            separatorBuilder: ((context, index) =>
                                const Divider()),
                            itemCount: serie!.seasons.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          } else if (state is DataFailure) {
            return Column(
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
      ),
    );
  }
}

Widget actorCard(context, ActorModel actor, String title) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: ((context) => BlocProvider(
                create: (context) {
                  return BioCubit();
                },
                child: ActorPage(
                  actorId: actor.id!,
                  name: actor.name!,
                ),
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
                  actor.img!,
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
          Padding(
            padding: const EdgeInsets.only(top: 2, right: 5, left: 5),
            child: Text(
              actor.name!,
              softWrap: true,
              style: const TextStyle(
                fontFamily: "REM",
                fontSize: 12,
                color: AppColors.offWhite,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
              child: Text(
                actor.character!,
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

Widget seasonCard(context, SeasonModel season, int serieId) {
  String ep = " Episodes";
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => SeasonPage(
                serieId: serieId,
                seasonName: season.name,
                seasonNumber: season.number,
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
                  season.poster,
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
          Padding(
            padding: const EdgeInsets.only(top: 2, right: 5, left: 5),
            child: Text(
              season.name,
              softWrap: true,
              style: const TextStyle(
                fontFamily: "REM",
                fontSize: 12,
                color: AppColors.offWhite,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
              child: Text(
                season.episodeCount.toString() + ep,
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
