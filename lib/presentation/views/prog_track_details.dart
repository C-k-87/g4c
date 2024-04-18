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
    List<SemesterCard> semCardList = [
      SemesterCard(
        subjects: ["Subject1", "Subject2", "Subject3"],
        semesterName: "Semester 1",
      ),
      SemesterCard(
        subjects: ["Subject1", "Subject2", "Subject3"],
        semesterName: "Semester 2",
      ),
      SemesterCard(
        subjects: ["Subject1", "Subject2", "Subject3"],
        semesterName: "Semester 3",
      ),
    ];
    return ListView(
      children: [
        heading(degreeName),
        AspectRatio(aspectRatio: 1.8, child: LineChart(data)),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(color: Colors.black),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "GRADES",
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        GradesCard(semCardList: semCardList)
      ],
    );
  }
}

class GradesCard extends StatefulWidget {
  const GradesCard({super.key, required this.semCardList});

  final List<SemesterCard> semCardList;

  @override
  State<GradesCard> createState() => _GradesCardState();
}

class _GradesCardState extends State<GradesCard> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      children: widget.semCardList
          .map((semCard) => ExpansionPanel(
              backgroundColor: const Color.fromARGB(255, 241, 241, 241),
              isExpanded: semCard.isExpanded,
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text(semCard.semesterName.toUpperCase()),
                );
              },
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: semCard.subjects.map((e) => Text(e)).toList(),
                ),
              )))
          .toList(),
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          widget.semCardList[panelIndex].isExpanded = isExpanded;
        });
      },
    );
  }
}

class SemesterCard {
  SemesterCard({
    required this.subjects,
    required this.semesterName,
  });

  final String semesterName;
  final List<String> subjects;
  bool isExpanded = false;
}
