import 'subject.dart';

class SemesterItem {
  SemesterItem(this.semesterNumber, this.subjectList);

  int semesterNumber;
  final List<Subject> subjectList;
  bool isExpanded = false;
}
