import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:g4c/domain/repositories/trait_colors.dart';

class PieChartWidget extends StatelessWidget {
  final Map<String, int> scores;
  const PieChartWidget({super.key, required this.scores});

  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> sectionList = [];
    for (var element in scores.entries) {
      sectionList.add(PieChartSectionData(
          value: element.value.toDouble() + 20,
          color: traitColors[element.key],
          showTitle: false,
          radius:
              (element.value + 30) * MediaQuery.of(context).size.width / 350));
    }

    return PieChart(
      PieChartData(
        sections: sectionList,
        centerSpaceRadius: MediaQuery.of(context).size.width / 15,
        sectionsSpace: 5.0,
      ),
    );
  }
}
