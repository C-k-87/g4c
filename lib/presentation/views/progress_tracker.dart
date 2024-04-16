import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';
import 'package:g4c/presentation/components/text_fields.dart';
import '../components/activity_card.dart';
import '../components/progress_card.dart';

void main() {
  runApp(MaterialApp(
    home: ProgressTracker(),
  ));
}

class ProgressTracker extends StatefulWidget {
  late final int count;
  late final List<int> resList;
  late final List<FlSpot> data;

  ProgressTracker({super.key}) {
    count = 5;
    resList = List.generate(count, (index) => 0);
    data = [];
  }

  @override
  State<ProgressTracker> createState() => _ProgressTrackerState();
}

class _ProgressTrackerState extends State<ProgressTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: G4CAppBar("Progress Tracker", true),
      drawer: const G4CDrawer(),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: [
          heading("Degree Program"),
          ProgressCard(
            gpa: 2.5,
            progress: 20,
            data: widget.data,
          ),
          const SizedBox(
            height: 20.0,
          ),
          heading("Extra Courses"),
          ProgressCard(
            gpa: 1.0,
            progress: 50,
            data: widget.data,
          ),
          const SizedBox(
            height: 20.0,
          ),
          heading("Extra Activities"),
          const SizedBox(
            height: 20.0,
          ),
          const ActivityCard(),
        ],
      ),
    );
  }
}
