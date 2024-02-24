import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  final Map<String, int> scores;
  const PieChartWidget({super.key, required this.scores});

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> traitColors = {
      'artistic': const Color.fromARGB(255, 75, 214, 82),
      'conventional': Color.fromRGBO(165, 110, 58, 1),
      'enterprising': const Color.fromARGB(255, 19, 127, 216),
      'investigative': const Color.fromARGB(255, 195, 79, 216),
      'realistic': const Color.fromARGB(255, 233, 99, 37),
      'social': const Color.fromARGB(255, 61, 235, 217),
    };
    List<PieChartSectionData> sectionList = [];
    for (var element in scores.entries) {
      sectionList.add(PieChartSectionData(
          value: element.value as double,
          color: traitColors[element.key],
          showTitle: false,
          radius: (element.value + 30) * 1.5));
    }

    return PieChart(
      PieChartData(
        sections: sectionList,
        centerSpaceRadius: 30.0,
      ),
    );
  }
}
