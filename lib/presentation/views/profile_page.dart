import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g4c/domain/use_cases/create_roles_list.dart';
import 'package:g4c/presentation/components/text_fields.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:g4c/data/entities/data_provider.dart';
import 'package:g4c/data/entities/quiz_scores.dart';
import 'package:g4c/domain/use_cases/data_handler.dart';
import 'package:g4c/domain/use_cases/routing.dart';
import 'package:g4c/presentation/components/card_widget.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';
import 'package:g4c/presentation/components/prof_pic.dart';
import 'package:g4c/presentation/components/top_card.dart';
import 'package:g4c/presentation/views/loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double fontsize = 15.0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadProfilePage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return const ErrorScreen();
        } else {
          return Consumer<DataProvider>(builder: (context, user, child) {
            print("Profile page reads ${user.userID}");
            return Page(
              username: user.userName,
              userImage: user.userProfPic,
              fontsize: fontsize,
              quizScores: user.userScores,
              rolesList: snapshot.data?['rolesList'] as List,
              extraCourses:
                  snapshot.data?['extraCourses'] as List<Map<String, dynamic>>,
              extraActivities: snapshot.data?['extraActivities']
                  as List<Map<String, dynamic>>,
            );
          });
        }
      },
    );
  }

  Future<Map<String, dynamic>> loadProfilePage() async {
    DataProvider provider = Provider.of<DataProvider>(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await provider.refreshUserData(prefs.getString('uid') ?? '');

    // Fetch roles list
    List rolesList = await DataHandler().getRolesList();

    // Fetch extra courses data from Firestore
    List<Map<String, dynamic>> extraCourses = [];
    List<Map<String, dynamic>> extraActivities = [];
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        final coursesSnapshot = await FirebaseFirestore.instance
            .collection('user')
            .doc(user.uid)
            .collection('courses')
            .get();
        extraCourses = coursesSnapshot.docs
            .map((doc) => {'id': doc.id, 'courseName': doc['courseName']})
            .toList();

        final activitiesSnapshot = await FirebaseFirestore.instance
            .collection('user')
            .doc(user.uid)
            .collection('activities')
            .get();
        extraActivities = activitiesSnapshot.docs
            .map((doc) => {'id': doc.id, 'activityName': doc['activityName']})
            .toList();
      } catch (e) {
        print('Error fetching extra data: $e');
      }
    } else {
      print('No user is currently signed in.');
    }

    return {
      'rolesList': rolesList,
      'extraCourses': extraCourses,
      'extraActivities': extraActivities
    };
  }
}

class Page extends StatelessWidget {
  final String username;
  final ProfPic userImage;
  final QuizScores quizScores;
  final double fontsize;
  final List rolesList;
  final List<Map<String, dynamic>> extraCourses;
  final List<Map<String, dynamic>> extraActivities;

  const Page({
    Key? key,
    required this.username,
    required this.userImage,
    required this.fontsize,
    required this.quizScores,
    required this.rolesList,
    required this.extraCourses,
    required this.extraActivities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      username, // USERNAME
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
                      child: userImage, // PROFILE PICTURE
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
                content: Column(
                  children: [
                    for (var course in extraCourses) Text(course['courseName']),
                  ],
                ),
                title: 'Extra Courses',
                fontsize: fontsize,
              ),
              CardWidget(
                onPressed: () {},
                content: Column(
                  children: [
                    for (var activity in extraActivities)
                      Text(activity['activityName']),
                  ],
                ),
                title: 'Extra Activities',
                fontsize: fontsize,
              ),
              const SizedBox(
                height: 10.0,
              ),
              heading("Recommended Job Roles"),
              ...createRecommendedRoles(rolesList, quizScores.getType()),
            ],
          ),
        ],
      ),
    );
  }
}
