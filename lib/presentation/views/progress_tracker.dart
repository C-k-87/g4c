import 'package:firebase_core/firebase_core.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:g4c/data/data_sources/firebase_options.dart';
import 'package:g4c/data/entities/course__detail_provider.dart';
import 'package:g4c/domain/use_cases/data_handler.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';
import 'package:g4c/presentation/components/text_fields.dart';
import 'package:g4c/presentation/views/loader.dart';
import 'package:provider/provider.dart';
import '../../data/entities/semester_item.dart';
import '../../data/entities/subject.dart';
import '../../domain/use_cases/get_degree_data.dart';
import '../components/activity_card.dart';
import '../components/progress_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => CourseDetailProvider(),
    child: const MaterialApp(
      home: ProgressTracker(),
    ),
  ));
}

class ProgressTracker extends StatefulWidget {
  const ProgressTracker({super.key});

  @override
  State<ProgressTracker> createState() => _ProgressTrackerState();
}

class _ProgressTrackerState extends State<ProgressTracker> {
  String? degreeCode;
  String? degreeName;
  double? degreeGpa;
  double? degreeProgress;
  List<List<double>>? userGradeValues;
  List<SemesterItem> semesterItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: G4CAppBar("Progress Tracker", true),
        drawer: const G4CDrawer(),
        body: Consumer<CourseDetailProvider>(
          builder: (context, CourseDetailProvider courseDetailProvider,
              Widget? child) {
            // TODO : -----------------------------------------------------------------

            // courseDetailProvider.setDegreeCode('bcs_degree');
            // courseDetailProvider.setGradeValues([
            //   [4.0, 2.0, 0.0],
            //   [0.0, 0.0, 0.0], //TODO : REMOVE. Testing only
            //   [0.0, 0.0, 0.0],
            // ]);
            // courseDetailProvider.setDegreeGpa(0);
            // courseDetailProvider.setDegreeProgress(0);

            // ---------------- REMOVE ------------------------------------------------

            return FutureBuilder(
                future: initializeProgressTracker(courseDetailProvider),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loader();
                  } else if (snapshot.hasError) {
                    return ErrorScreen(
                      error: snapshot.error,
                    );
                  } else {
                    return Page(
                      degreeName: degreeName ?? "n/a",
                      semesterItems: semesterItems,
                      gpa: degreeGpa ?? 0,
                      progress: degreeProgress ?? 0,
                      spots: getDegreeData(semesterItems, type: "spots"),
                    );
                  }
                });
          },
        ));
  }

  Future<void> initializeProgressTracker(
      CourseDetailProvider courseDetailProvider) async {
    degreeCode = courseDetailProvider.degreeCode;
    userGradeValues = courseDetailProvider.degreeGradeValues;
    print(userGradeValues);
    if (degreeCode != null) {
      Map courseJson = await DataHandler().getDegreeProgram(degreeCode!) as Map;
      updateDegreeVariables(
          courseJson); // Set degree program scores and details locally
    } else {
      throw Exception("Error: degreeCode is null");
    }
  }

  void updateDegreeVariables(Map courseJson) {
    int index = 0;
    degreeName = courseJson["courseName"];
    Map courseData = courseJson["courseData"];

    if (semesterItems.isEmpty) {
      for (var semester in courseData.keys) {
        List<Subject> subjectList = [];
        for (var i = 0; i < courseData[semester].length; i++) {
          var subject = courseData[semester][i];
          subjectList.add(Subject(subject["course"], subject["id"],
              subject["credits"] as double, userGradeValues?[index][i] ?? 0.0));
        }
        semesterItems.add(SemesterItem(index + 1, subjectList));
        index++;
      }
    }

    degreeGpa = getDegreeData(semesterItems, type: "gpa");
    degreeProgress = getDegreeData(semesterItems, type: "progress");
  }
}

class Page extends StatelessWidget {
  final double gpa;
  final double progress;
  final String degreeName;
  final List<FlSpot> spots;
  final List<SemesterItem> semesterItems;

  const Page(
      {super.key,
      required this.degreeName,
      required this.semesterItems,
      required this.gpa,
      required this.progress,
      required this.spots});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: [
        heading("Degree Program"),
        ProgressCard(
          gpa: gpa,
          progress: progress,
          spots: spots,
          degreeName: degreeName,
          semesterItems: semesterItems,
        ),
        // const SizedBox(
        //   height: 20.0,
        // ),
        // heading("Extra Courses"),
        // ProgressCard(
        //   gpa: 1.0,
        //   progress: 50,
        //   data: widget.data,
        //   courseCode: 'extra_course',
        // ),
        const SizedBox(
          height: 20.0,
        ),
        heading("Extra Activities"),
        const SizedBox(
          height: 20.0,
        ),
        const ActivityCard(),
      ],
    );
  }
}
