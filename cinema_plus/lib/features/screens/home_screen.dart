import 'package:cinema_plus/core/services/movie_service.dart';
import 'package:cinema_plus/features/model/movie_model.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late MovieModel movieModel;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MovieService movieService = MovieService();
    Future<List<MovieModel>> trending = MovieService().getTrending();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cinema Plus",
          style: TextStyle(color: AppColors.white, fontFamily: "REM"),
        ),
        backgroundColor: AppColors.terinary,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.white,
          tabs: const [
            Tab(
              child: Text(
                "Movies",
                style: TextStyle(color: AppColors.white),
              ),
            ),
            Tab(
              text: "Series",
            )
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: AppColors.primary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  //movieModel = await movieService.getMovie(872585);
                  print(trending.runtimeType);
                },
                child: const Text(
                  "Click For Oppenheimer",
                  style: TextStyle(color: AppColors.white, fontFamily: "REM"),
                )),
            Center(
              child: SizedBox(
                height: 200,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return movies();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget movies(/*MovieModel movie*/) {
  return Container(
    margin: const EdgeInsets.all(20),
    height: 50,
    width: 150,
    color: AppColors.transperantOffWhite,
    child: const Center(
      child: Text(
        "hello flutter",
        style: TextStyle(
          fontFamily: "montserrat",
          fontSize: 22,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
