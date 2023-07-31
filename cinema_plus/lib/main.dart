import 'package:cinema_plus/core/bloc/data_cubit/data_cubit.dart';
import 'package:cinema_plus/core/services/actor_service.dart';
import 'package:cinema_plus/core/services/genre_service.dart';
import 'package:cinema_plus/core/services/movie_service.dart';
import 'package:cinema_plus/core/services/series_service.dart';
import 'package:cinema_plus/core/utils/app_colors.dart';
import 'package:cinema_plus/features/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
        return DataCubit(
          MovieService(),
          SeriesService(),
          ActorService(),
          GenreService(),
        );
      },
      child: const MyApp(),
    ),
  );
}

const MaterialColor primarySwatch = MaterialColor(0xFFCC7A09, <int, Color>{
  50: AppColors.white,
  100: AppColors.offWhite,
  200: AppColors.black,
  500: AppColors.terinary,
  600: AppColors.secondery,
  700: AppColors.primary,
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(primarySwatch: primarySwatch),
    );
  }
}
