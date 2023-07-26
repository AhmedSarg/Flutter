import 'package:cinema_plus/core/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
    MovieService movieService = MovieService(movieId: 872585);
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
          tabs: const [Tab(text: "Movies"), Tab(text: "Series")],
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
                onPressed: () => movieService.getMovie(),
                child: const Text("Click For Oppenheimer")),
            // Center(
            //   child: ListView.separated(
            //     scrollDirection: Axis.vertical,
            //     separatorBuilder: (BuildContext context, int index) =>
            //         const Divider(),
            //     itemCount: 5,
            //     itemBuilder: (BuildContext context, int index) {
            //       return movie();
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

Widget movie() {
  return Container(
    margin: const EdgeInsets.all(20),
    height: 100,
    width: 100,
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
