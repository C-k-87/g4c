import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

LineChartData generateBars(List<FlSpot> spots, [double? maxY = 4.0]) {
  return LineChartData(
    backgroundColor: Colors.black87,
    minX: 0,
    minY: 0,
    maxY: maxY,
    titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: const AxisTitles(
            drawBelowEverything: false,
            axisNameWidget: Text("GPA"),
            sideTitles: SideTitles(showTitles: true, reservedSize: 30.0)),
        bottomTitles: AxisTitles(
            drawBelowEverything: false,
            axisNameWidget: const Text("Semester"),
            sideTitles: SideTitles(
              interval: 1.0,
              reservedSize: 30.0,
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                    axisSide: meta.axisSide, child: Text("${(value + 1)}"));
              },
            ))),
    lineBarsData: [
      LineChartBarData(
        spots: spots,
        isCurved: true,
        preventCurveOverShooting: true,
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
