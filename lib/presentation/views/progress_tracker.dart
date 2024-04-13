import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';

void main() {
  runApp(const MaterialApp(
    home: ProgressTracker(),
  ));
}

class ProgressTracker extends StatelessWidget {
  const ProgressTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: G4CAppBar("Progress Tracker", true),
      drawer: const G4CDrawer(),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CourseCard(),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('data'),
              ),
            ],
          ),
          Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                LineChart(LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [FlSpot(0, 1),FlSpot(1, 3),FlSpot(3, 5),FlSpot(4, 2)], // TODO : DATA
                    )
                  ]
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
