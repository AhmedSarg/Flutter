import 'package:cinema_plus/core/bloc/data_cubit/data_cubit.dart';
import 'package:cinema_plus/core/bloc/data_cubit/data_state.dart';
import 'package:cinema_plus/core/bloc/info_cubit/info_cubit.dart';
import 'package:cinema_plus/core/bloc/info_cubit/info_state.dart';
import 'package:cinema_plus/core/utils/app_colors.dart';
import 'package:cinema_plus/features/model/series_model.dart';
import 'package:cinema_plus/features/screens/movie_page.dart';
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
          return BlocBuilder<InfoCubit, InfoState>(
            builder: ((context, state) {
              if (state is InfoShown) {
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
                                          loadingBuilder: ((context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            } else {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(
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
                                right: 20.0,
                                left: 20,
                                top: 10,
                                bottom: 15,
                              ),
                              child: SizedBox(
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
                                    season!.rating.toString(),
                                    style: const TextStyle(
                                      color: AppColors.terinary,
                                      fontSize: 20,
                                      fontFamily: "REM",
                                      fontWeight: FontWeight.w600,
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
                                          season!.airDate!,
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
                                          "Episode Count :  ",
                                          style: TextStyle(
                                            color: AppColors.offWhite,
                                            fontSize: 14,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          season!.episodeCount.toString(),
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
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 35,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Episodes",
                                    style: TextStyle(
                                        color: AppColors.offWhite,
                                        fontSize: 18,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w900),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      BlocProvider.of<InfoCubit>(context)
                                          .switchInfoState();
                                    },
                                    icon: const Icon(FontAwesomeIcons.angleUp),
                                    color: AppColors.offWhite,
                                  )
                                ],
                              ),
                            ),
                            for (var i = 0; i < season!.episodeCount; i++)
                              episodeCard(
                                context,
                                season!.episodes[i],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
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
                                          loadingBuilder: ((context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            } else {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(
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
                                right: 20.0,
                                left: 20,
                                top: 10,
                                bottom: 15,
                              ),
                              child: SizedBox(
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
                                    season!.rating.toString(),
                                    style: const TextStyle(
                                      color: AppColors.terinary,
                                      fontSize: 20,
                                      fontFamily: "REM",
                                      fontWeight: FontWeight.w600,
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
                                          season!.airDate!,
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
                                          "Episode Count :  ",
                                          style: TextStyle(
                                            color: AppColors.offWhite,
                                            fontSize: 14,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          season!.episodeCount.toString(),
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
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 35,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Episodes",
                                    style: TextStyle(
                                        color: AppColors.offWhite,
                                        fontSize: 18,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w900),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      BlocProvider.of<InfoCubit>(context)
                                          .switchInfoState();
                                    },
                                    icon:
                                        const Icon(FontAwesomeIcons.angleDown),
                                    color: AppColors.offWhite,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            }),
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

Widget episodeCard(context, EpisodeModel episode) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 250,
      width: double.infinity,
      margin: const EdgeInsets.all(20),
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
          Container(
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
                episode.cover,
                width: 350,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    episode.name,
                    softWrap: true,
                    style: const TextStyle(
                      fontFamily: "REM",
                      fontSize: 16,
                      color: AppColors.offWhite,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: Text(
                  episode.rating.toString(),
                  softWrap: true,
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 12,
                    color: AppColors.terinary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                episode.airDate,
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
