import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:g4c/domain/use_cases/routing.dart';
import 'package:g4c/presentation/components/text_fields.dart';

import '../../data/entities/semester_item.dart';
import '../../domain/use_cases/generate_bars.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard(
      {super.key,
      required this.gpa,
      required this.progress,
      required this.spots,
      required this.degreeName,
      required this.semesterItems});
  final double gpa;
  final double progress;
  final List<FlSpot> spots;
  final String degreeName;
  final List<SemesterItem> semesterItems;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.0),
      clipBehavior: Clip.antiAlias,
      color: const Color.fromARGB(255, 195, 255, 195),
      child: InkWell(
        onTap: () {
          navtoProgTrackCourseDetails(context, degreeName, semesterItems,
              degreeName, gpa, progress, spots);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0))),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 100.0, vertical: 10.0),
                child: Text(
                  degreeName,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Card(
                elevation: 10.0,
                child: AspectRatio(
                  aspectRatio: 1.8,
                  child: LineChart(generateBars(spots)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  subheading("Progress: $progress%"),
                  subheading("GPA: $gpa"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
