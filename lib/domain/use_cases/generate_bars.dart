import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

LineChartData generateBars(List<FlSpot> spots, [double? maxY = 4.0]) {
  return LineChartData(
    backgroundColor: Colors.black87,
    minX: 0,
    minY: 0,
    maxY: maxY,
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
