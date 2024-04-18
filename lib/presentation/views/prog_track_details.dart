import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';
import 'package:g4c/presentation/components/text_fields.dart';

class ProgTrackDetails extends StatefulWidget {
  final LineChartData data;
  const ProgTrackDetails({super.key, required this.data});

  @override
  State<ProgTrackDetails> createState() => _ProgTrackDetailsState();
}

class _ProgTrackDetailsState extends State<ProgTrackDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: G4CAppBar('Course Details', true),
      drawer: const G4CDrawer(),
      body: Page(
        degreeName: 'Degree',
        data: widget.data,
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String degreeName;
  final LineChartData data;

  const Page({super.key, required this.degreeName, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        heading(degreeName),
        AspectRatio(aspectRatio: 1.8, child: LineChart(data)),

      ],
    );
  }
}
