import 'package:cinema_plus/core/bloc/data_cubit/data_cubit.dart';
import 'package:cinema_plus/core/bloc/data_cubit/data_state.dart';
import 'package:cinema_plus/features/model/movie_model.dart';
import 'package:cinema_plus/features/model/series_model.dart';
import 'package:cinema_plus/features/screens/movie_page.dart';
import 'package:cinema_plus/features/screens/series_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/services/series_service.dart';
import '../../core/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late SeriesModel seriesModel;
  late SeriesService seriesService;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DataCubit cubit = BlocProvider.of<DataCubit>(context);
    cubit.getExplore();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cinema Plus",
          style: TextStyle(color: AppColors.white, fontFamily: "REM"),
        ),
        actions: [
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.search),
          )
        ],
        backgroundColor: AppColors.terinary,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.white,
          tabs: const [
            Tab(
              child: Text(
                "Explore",
                style: TextStyle(color: AppColors.white),
              ),
            ),
            Tab(
              child: Text(
                "Movies",
                style: TextStyle(color: AppColors.white),
              ),
            ),
            Tab(
              child: Text(
                "Series",
                style: TextStyle(color: AppColors.white),
              ),
            )
          ],
        ),
      ),
      backgroundColor: AppColors.primary,
      body: BlocBuilder<DataCubit, DataState>(
        builder: ((context, state) {
          if (state is DataSuccess) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(color: AppColors.primary),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    movieList(cubit.popularMovies, "Popular Movies"),
                    movieList(cubit.topRatedMovies, "Top Rated Movies"),
                    seriesList(cubit.popularSeries, "Popular Series"),
                    seriesList(cubit.topRatedSeries, "Top Rated Series"),
                  ],
                ),
              ),
            );
          } else if (state is DataFailure) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
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

Widget movieList(movies, title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20.0, bottom: 10, top: 30),
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: "REM",
            fontWeight: FontWeight.w900,
            fontSize: 24,
            color: AppColors.terinary,
          ),
        ),
      ),
      SizedBox(
        height: 370,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return movie(context, movies[index]);
          },
        ),
      ),
    ],
  );
}

Widget seriesList(series, title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20.0, bottom: 10, top: 30),
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: "REM",
            fontWeight: FontWeight.w900,
            fontSize: 24,
            color: AppColors.terinary,
          ),
        ),
      ),
      SizedBox(
          height: 370,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: series.length,
            itemBuilder: (BuildContext context, int index) {
              return serie(context, series[index]);
            },
          )),
    ],
  );
}

Widget movie(context, MovieModel movie) {
  return GestureDetector(
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: ((context) => MoviePage(
                movieId: movie.id,
                title: movie.title,
              )),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.all(20),
      width: 180,
      height: double.infinity,
      decoration: const BoxDecoration(
          color: AppColors.transperantOffWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(10),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 270,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(10),
                  )),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.network(
                      movie.poster,
                      fit: BoxFit.fill,
                      width: 180,
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
                          const Center(
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
                            movie.rating.toString(),
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
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 2, bottom: 5, right: 10, left: 10),
              child: Text(
                movie.title,
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

Widget serie(context, SeriesModel serie) {
  return GestureDetector(
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: ((context) => SeriesPage(
                serieId: serie.id,
                title: serie.title,
              )),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.all(20),
      width: 180,
      height: double.infinity,
      decoration: const BoxDecoration(
          color: AppColors.transperantOffWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(10),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 270,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(10),
                  )),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.network(
                      serie.poster,
                      fit: BoxFit.fill,
                      width: 180,
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
                          const Center(
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
                            serie.rating.toString(),
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
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 2, bottom: 5, right: 10, left: 10),
              child: Text(
                serie.title,
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
