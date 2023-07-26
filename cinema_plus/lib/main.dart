import 'package:cinema_plus/core/utils/app_colors.dart';
import 'package:cinema_plus/features/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const MaterialColor primarySwatch = MaterialColor(0xFFEC9A29, <int, Color>{
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
