import 'package:cinema_plus/core/utils/app_colors.dart';
import 'package:cinema_plus/features/model/actor_model.dart';
import 'package:flutter/material.dart';

class ActorPage extends StatelessWidget {
  final Future<ActorModel> actor;
  final String name;
  const ActorPage({super.key, required this.actor, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: const TextStyle(color: AppColors.white, fontFamily: "REM"),
        ),
      ),
      backgroundColor: AppColors.primary,
      body: FutureBuilder<ActorModel>(
          future: actor,
          builder: (context, snapshot) {
            Widget result;
            if (snapshot.hasData) {
              result = Center(child: Text(snapshot.data!.character.toString()));
              snapshot.data!.credits.forEach((element) {});
            } else if (snapshot.hasError) {
              result = Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              result = const Center(
                child: CircularProgressIndicator(
                  color: AppColors.terinary,
                  strokeWidth: 1,
                ),
              );
            }
            return result;
          }),
    );
  }
}
