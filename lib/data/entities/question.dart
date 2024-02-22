class Question {
  final String questionText;
  final String trait;

  Question({required this.questionText, required this.trait});

  String getQuestion() {
    return questionText;
  }

  String getTrait() {
    return trait;
  }
}
