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
              ActorModel actorDetails = snapshot.data!;
              result = Column(
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
                                        actorDetails.img!,
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
                                  actorDetails.name!,
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
                              "Biography",
                              style: TextStyle(
                                  color: AppColors.offWhite,
                                  fontSize: 18,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 15),
                            child: Container(
                              height: 100,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Text(
                                    actorDetails.bio!,
                                    style: const TextStyle(
                                        color: AppColors.offWhite,
                                        fontSize: 14,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Container(
                                    height: 30,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.offWhite,
                                        width: 0.2,
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_downward,
                                        color: AppColors.offWhite,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
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
