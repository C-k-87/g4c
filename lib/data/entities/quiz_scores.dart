class QuizScores {
  int artistic;
  int conventional;
  int enterprising;
  int investigative;
  int realistic;
  int social;

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

  String getType() {
    return getSortedScores().entries.last.key;
  }

  void setScore(String key, int score) {
    switch (key) {
      case 'a':
        artistic = score;
        break;
      case 'c':
        conventional = score;
        break;
      case 'e':
        enterprising = score;
        break;
      case 'i':
        investigative = score;
        break;
      case 'r':
        realistic = score;
        break;
      case 's':
        social = score;
        break;
    }
  }
}
