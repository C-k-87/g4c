class QuizScores {
  final int artistic;
  final int conventional;
  final int enterprising;
  final int investigative;
  final int realistic;
  final int social;

  QuizScores(this.artistic, this.conventional, this.enterprising,
      this.investigative, this.realistic, this.social);

  Map<String, int> getScores() {
    Map<String, int> scores = {
      'realistic': realistic,
      'artistic': artistic,
      'conventional': conventional,
      'enterprising': enterprising,
      'investigative': investigative,
      'social': social
    };
    return scores;
  }

  Map<String, int> getSortedScores() {
    List<MapEntry<String, int>> scoreList = getScores().entries.toList();
    scoreList.sort((a, b) => a.value.compareTo(b.value));
    Map<String, int> scores = Map.fromEntries(scoreList);
    return scores;
  }
}
