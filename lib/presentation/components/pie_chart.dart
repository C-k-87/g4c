import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:g4c/domain/repositories/trait_colors.dart';

class PieChartWidget extends StatelessWidget {
  final Map<String, int> scores;
  final void Function(FlTouchEvent, PieTouchResponse?)? callback;
  final int touchedIndex;

  const PieChartWidget(
      {super.key,
      required this.scores,
      this.callback,
      required this.touchedIndex});

  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> sectionList = [];
    int i = 0;
    int total = 0;
    for (var element in scores.entries) {
      total += element.value;
    }
    for (var element in scores.entries) {
      sectionList.add(PieChartSectionData(
          value: element.value.toDouble() + 20,
          color: traitColors[element.key],
          showTitle: true,
          titlePositionPercentageOffset: 0.8,
          radius: (element.value + 30) * MediaQuery.of(context).size.width / 350,
          borderSide: touchedIndex == i ? selectedBorder :null),
          );
    i++;
    }

    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(
          enabled: false,
          touchCallback: callback,
        ),
        sections: sectionList,
        centerSpaceRadius: MediaQuery.of(context).size.width / 15,
        sectionsSpace: 5.0,
      ),
    );
  }

  final BorderSide selectedBorder = const BorderSide(
    color: Color.fromARGB(100, 0, 0, 0),
    width: 4.0,
    // style: BorderStyle.solid,
  );
}
