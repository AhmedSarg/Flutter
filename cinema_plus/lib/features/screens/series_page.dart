import 'package:cinema_plus/core/utils/app_colors.dart';
import 'package:cinema_plus/features/model/actor_model.dart';
import 'package:cinema_plus/features/model/series_model.dart';
import 'package:flutter/material.dart';

class SeriesPage extends StatefulWidget {
  final Future<SeriesModel> serie;
  final String title;
  const SeriesPage({super.key, required this.serie, required this.title});

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
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
      body: FutureBuilder<SeriesModel>(
        future: widget.serie,
        builder: (context, snapshot) {
          late Widget result;
          if (snapshot.hasData) {
            result = Column(
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
                            snapshot.data!.backdrop,
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
                                  snapshot.data!.poster,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Text(
                            snapshot.data!.title,
                            style: const TextStyle(
                                color: AppColors.offWhite,
                                fontSize: 18,
                                fontFamily: "REM",
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
                            snapshot.data!.overview,
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
                              return actorCard(context,
                                  snapshot.data!.cast[index], widget.title);
                            }),
                            separatorBuilder: ((context, index) =>
                                const Divider()),
                            itemCount: snapshot.data!.cast.length,
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
                                  context, snapshot.data!.seasons[index]);
                            }),
                            separatorBuilder: ((context, index) =>
                                const Divider()),
                            itemCount: snapshot.data!.seasons.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            result = Center(
                child: Text(
              snapshot.error.toString(),
              style: const TextStyle(color: AppColors.offWhite),
            ));
          } else {
            result = const Center(
              child: CircularProgressIndicator(
                color: AppColors.terinary,
                strokeWidth: 1,
              ),
            );
          }
          return result;
        },
      ),
    );
  }
}

Widget actorCard(context, ActorModel actor, String title) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
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
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.warning)),
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
                actor.character[title]!,
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

Widget seasonCard(context, Season season) {
  String ep = " Episodes";
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
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
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.warning)),
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
