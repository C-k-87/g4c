import 'package:flutter/material.dart';
import 'package:g4c/data/entities/quiz_scores.dart';
import 'package:g4c/domain/use_cases/set_image.dart';
import 'package:g4c/presentation/components/pie_chart.dart';
import 'package:g4c/presentation/components/top_card.dart';

void main() {
  runApp(const Test());
}

class Test extends StatelessWidget {
  const Test({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizResults(quizScores: QuizScores(2, 5, 12, 4, 19, 8)),
    );
  }
}

class QuizResults extends StatelessWidget {
  final QuizScores quizScores;

  late final Map<String, int> persList;
  QuizResults({super.key, required this.quizScores}) {
    persList = quizScores.getSortedScores();
  }

  @override
  Widget build(BuildContext context) {
    TopCard typeCard = TopCard.factory(persList.keys.last);
    Image typeText = setImage(persList.keys.last);

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          typeCard,
          const SizedBox(
            height: 25.0,
          ),
          SizedBox(
            width: 80.0,
            height: 80.0,
            child: typeText,
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: MediaQuery.of(context).size.width / 2,
            width: MediaQuery.of(context).size.width / 2,
            child: PieChartWidget(
              scores: quizScores.getScores(),
            ),
          ),
        ],
      ),
    );
  }
}
