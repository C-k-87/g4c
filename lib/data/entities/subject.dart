class Subject {
  Subject(this.subjectName, this.subjectCode, this.subjectCredits,
      [this.gradeValue = 0.0]);
  final String subjectName;
  final String subjectCode;
  final double subjectCredits;
  double gradeValue;
}
