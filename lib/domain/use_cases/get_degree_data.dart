import 'package:fl_chart/fl_chart.dart';
import 'package:g4c/data/entities/semester_item.dart';

getDegreeData(List<SemesterItem> semesterItems, {required type}) {
  int index = 0;
  double totalGpv = 0;
  double totalCredits = 0;
  double finishedCredits = 0;
  double gpa = 0;
  double progress = 0;
  List<FlSpot> tempSpots = [];

  for (var semester in semesterItems) {
    double semesterGpv = 0.0;
    double semesterFinishedCredits = 0.0;
    for (var subject in semester.subjectList) {
      semesterGpv += subject.gradeValue * subject.subjectCredits;
      totalGpv += subject.gradeValue * subject.subjectCredits;
      totalCredits += subject.subjectCredits;
      if (subject.gradeValue != 0) {
        finishedCredits += subject.subjectCredits;
        semesterFinishedCredits += subject.subjectCredits;
      }
    }
    semesterFinishedCredits != 0
        ? tempSpots.add(
            FlSpot(index.toDouble(), semesterGpv / semesterFinishedCredits))
        : tempSpots.add(FlSpot(index.toDouble(), 0));
    index++;
  }

  gpa = double.parse((totalGpv / finishedCredits).toStringAsFixed(2));
  progress =
      double.parse((100 * finishedCredits / totalCredits).toStringAsFixed(2));

  switch (type) {
    case "gpa":
      return gpa;
    case "progress":
      return progress;
    case "spots":
      return tempSpots;
  }
}
