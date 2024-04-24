import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:g4c/data/entities/course__detail_provider.dart';
import 'package:g4c/presentation/components/btn_white.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';
import 'package:g4c/presentation/components/text_fields.dart';
import 'package:provider/provider.dart';

import '../../data/entities/semester_item.dart';
import '../../domain/use_cases/generate_bars.dart';
import '../../domain/use_cases/get_degree_data.dart';
import '../components/grades_card.dart';

class ProgTrackDetails extends StatefulWidget {
  const ProgTrackDetails(
      {super.key,
      required this.courseCode,
      required this.semesterItems,
      required this.degreeName,
      required this.gpa,
      required this.progress,
      required this.spots});
  final double gpa;
  final double progress;
  final String courseCode;
  final String degreeName;
  final List<FlSpot> spots;
  final List<SemesterItem> semesterItems;
  @override
  State<ProgTrackDetails> createState() => _ProgTrackDetailsState();
}

class _ProgTrackDetailsState extends State<ProgTrackDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: G4CAppBar('Course Details', true),
      body: Consumer<CourseDetailProvider>(
        builder: (BuildContext context, CourseDetailProvider provider,
            Widget? child) {
          return Page(
            degreeName: widget.degreeName,
            semesterItems: widget.semesterItems,
            expansionCallback: (panelIndex, isExpanded) => setState(
              () {
                widget.semesterItems[panelIndex].isExpanded = isExpanded;
              },
            ),
            gpa: widget.gpa,
            progress: widget.progress,
            spots: widget.spots,
            provider: provider,
          );
        },
      ),
    );
  }
}

class Page extends StatefulWidget {
  final CourseDetailProvider provider;
  final double gpa;
  final double progress;
  final String degreeName;
  final List<FlSpot> spots;
  final List<SemesterItem> semesterItems;
  final Function(int, bool)? expansionCallback;

  const Page({
    super.key,
    required this.degreeName,
    required this.spots,
    required this.semesterItems,
    required this.expansionCallback,
    required this.gpa,
    required this.progress,
    required this.provider,
  });

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  double? gpa;
  double? progress;
  List<FlSpot>? spots;

  @override
  Widget build(BuildContext context) {
    gpa = gpa ?? widget.gpa;
    progress = progress ?? widget.progress;
    return ListView(
      children: [
        const SizedBox(height: 20.0),
        Center(child: heading(widget.degreeName)),
        AspectRatio(
            aspectRatio: 1.8,
            child: LineChart(generateBars(spots ?? widget.spots, 4.0))),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Progress: $progress%"),
            Text("GPA: $gpa"),
          ],
        ),
        const SizedBox(height: 20.0),
        Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(color: Colors.black),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "GRADES",
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        GradesCard(
          expansionCallback: widget.expansionCallback,
          semesterItems: widget.semesterItems,
        ),
        const SizedBox(
          height: 20.0,
        ),
        BtnWhite(
          onpressed: updateResults,
          btnText: "Update Results",
          width: 30.0,
        ),
      ],
    );
  }

  updateResults() {
    CourseDetailProvider courseDetailProvider = widget.provider;
    List<List<double>> updatedGradeValues = [];
    for (var semester in widget.semesterItems) {
      List<double> subjectResults = [];
      for (var subject in semester.subjectList) {
        subjectResults.add(subject.gradeValue);
      }
      updatedGradeValues.add(subjectResults);
    }
    courseDetailProvider.setGradeValues(updatedGradeValues);

    setState(() {
      gpa = getDegreeData(widget.semesterItems, type: "gpa");
      progress = getDegreeData(widget.semesterItems, type: "progress");
      spots = getDegreeData(widget.semesterItems, type: "spots");
    });

    courseDetailProvider.setDegreeGpa(gpa ?? 0.0);
    courseDetailProvider.setDegreeProgress(progress ?? 0.0);
  }
}
