import 'package:flutter/material.dart';
import 'package:g4c/data/entities/quiz_scores.dart';
import 'package:g4c/domain/use_cases/create_roles_list.dart';
import 'package:g4c/domain/use_cases/data_handler.dart';
import 'package:g4c/domain/use_cases/routing.dart';
import 'package:g4c/domain/use_cases/firestore_sp.dart';
import 'package:g4c/presentation/components/card_widget.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';
import 'package:g4c/presentation/components/prof_pic.dart';
import 'package:g4c/presentation/components/text_fields.dart';
import 'package:g4c/presentation/components/top_card.dart';
import 'package:g4c/presentation/views/loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double fontsize = 15.0;
  QuizScores quizScores = QuizScores(0, 0, 0, 0, 0, 0);
  String? username;
  String? userImage;
  List rolesList = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadProfilePage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          } else if (snapshot.hasError) {
            return const ErrorScreen();
          } else {
            rolesList = snapshot.data;
            return Scaffold(
              appBar: G4CAppBar('Profile Page', false),
              drawer: const G4CDrawer(),
              body: ListView(
                children: [
                  Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.center,
                        children: [
                          SizedBox(
                            height: 220.0,
                            child: TopCard(
                              content: Container(
                                color: const Color.fromARGB(255, 195, 255, 195),
                              ),
                              color: const Color.fromARGB(255, 195, 255, 195),
                            ),
                          ),
                          Positioned(
                            top: 50.0,
                            child: Text(
                              username ?? " ", // USERNAME
                              style: const TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 120.0,
                            child: Container(
                              width: 200.0,
                              height: 200.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ProfPic(url: userImage), // PROFILE PICTURE
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 120.0),
                      CardWidget(
                        onPressed: () {
                          navtoQuizRetake(context, quizScores);
                        },
                        content: Container(
                          child: switch (quizScores.getType()) {
                            'artistic' => Image.asset(
                                'asset_lib/images/personalityimages/A_Exp.png',
                                fit: BoxFit.fill,
                              ),
                            'conventional' => Image.asset(
                                'asset_lib/images/personalityimages/C_Exp.png',
                                fit: BoxFit.fill,
                              ),
                            'enterprising' => Image.asset(
                                'asset_lib/images/personalityimages/E_Exp.png',
                                fit: BoxFit.fill,
                              ),
                            'investigative' => Image.asset(
                                'asset_lib/images/personalityimages/I_Exp.png',
                                fit: BoxFit.fill,
                              ),
                            'realistic' => Image.asset(
                                'asset_lib/images/personalityimages/R_Exp.png',
                                fit: BoxFit.fill,
                              ),
                            'social' => Image.asset(
                                'asset_lib/images/personalityimages/S_Exp.png',
                                fit: BoxFit.fill,
                              ),
                            String() => Image.asset(
                                'asset_lib/images/back.png',
                                fit: BoxFit.fill,
                              ),
                          },
                        ),
                        title: 'Personality Type',
                        fontsize: fontsize,
                      ),
                      CardWidget(
                        onPressed: () {
                          navtoProgressTracker(context);
                        },
                        content: Container(
                          height: 100.0,
                        ),
                        title: 'Course Progress',
                        fontsize: fontsize,
                      ),
                      CardWidget(
                        onPressed: () {},
                        content: Container(
                          height: 100.0,
                        ),
                        title: 'Extra Activities',
                        fontsize: fontsize,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      heading("Recommended Job Roles"),
                      ...createRecommendedRoles(
                          rolesList, quizScores.getType()),
                    ],
                  ),
                ],
              ),
            );
          }
        });
  }

  Future<dynamic> loadProfilePage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await setUserProfile(prefs.getString('uid')!);
    username = prefs.getString('name');
    userImage = prefs.getString('imageURL');
    quizScores.setScore('a', prefs.getInt('ascore') ?? 0);
    quizScores.setScore('c', prefs.getInt('cscore') ?? 0);
    quizScores.setScore('e', prefs.getInt('escore') ?? 0);
    quizScores.setScore('i', prefs.getInt('iscore') ?? 0);
    quizScores.setScore('r', prefs.getInt('rscore') ?? 0);
    quizScores.setScore('s', prefs.getInt('sscore') ?? 0);
    return await DataHandler().getRolesList();
  }
}
