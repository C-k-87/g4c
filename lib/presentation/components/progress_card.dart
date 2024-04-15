import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/text_fields.dart';

class ProgressCard extends StatelessWidget {
  final double gpa = 2.5;
  final double progress = 20;

  const ProgressCard({super.key, required gpa, required progress});

  LineChartData data() {
    return LineChartData(
      backgroundColor: Colors.black87,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
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
    return Card(
      clipBehavior: Clip.antiAlias,
      color: const Color.fromARGB(255, 195, 255, 195),
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
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Card(
              elevation: 10.0,
              child: AspectRatio(
                aspectRatio: 1.8,
                child: LineChart(data()),
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
    );
  }
}
