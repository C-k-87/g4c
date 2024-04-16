import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:g4c/domain/use_cases/routing.dart';
import 'package:g4c/presentation/components/text_fields.dart';

class ProgressCard extends StatelessWidget {
  final double gpa;
  final double progress;
  final List<FlSpot> data;

  const ProgressCard({super.key, this.gpa=2.5, this.progress=10, required this.data});

  LineChartData bars() {
    return LineChartData(
      backgroundColor: Colors.black87,
      lineBarsData: [
        LineChartBarData(
          spots: data,
          isCurved: true,
          gradient: const LinearGradient(
            colors: [Colors.cyan, Colors.blue],
          ),
          barWidth: 5,
          belowBarData: BarAreaData(
            show: true,
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.blueGrey],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.0),
      clipBehavior: Clip.antiAlias,
      color: const Color.fromARGB(255, 195, 255, 195),
      child: InkWell(
        onTap: (){navtoProgTrackCourseDetails(context,bars());},
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
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
                child: Text(
                  "Course Name",
                  style: TextStyle(color: Colors.white),
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
                  child: LineChart(bars()),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  subheading("Progress: $progress%"),
                  subheading("GPA:$gpa"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
