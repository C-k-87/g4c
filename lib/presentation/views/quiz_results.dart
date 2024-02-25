import 'package:flutter/material.dart';
import 'package:g4c/data/entities/quiz_scores.dart';
import 'package:g4c/domain/repositories/type_descriptions.dart';
import 'package:g4c/domain/use_cases/routing.dart';
import 'package:g4c/domain/use_cases/set_image.dart';
import 'package:g4c/presentation/components/btn_black.dart';
import 'package:g4c/presentation/components/legend.dart';
import 'package:g4c/presentation/components/pie_chart.dart';
import 'package:g4c/presentation/components/text_fields.dart';
import 'package:g4c/presentation/components/top_card.dart';
import 'package:g4c/presentation/views/profile_page.dart';

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
        children: [
          Column(
            children: [
              typeCard,
              const SizedBox(
                height: 25.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: typeText,
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Legend(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    child: PieChartWidget(
                      scores: quizScores.getScores(),
                    ),
                  ),
                ],
              ),
              // const Text(
              //   "What does that mean?",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              // ),
              Center(
                child: heading("WHAT DOES THAT MEAN?"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: body(getDescription(quizScores.getType())),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: heading("Recommended jobs:"),
              ),
              //TODO:Implement recommended *job list display -------------------
              const Card(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 150.0, vertical: 50.0),
                  child: Text("Job Roles"),
                ),
              ),
              const Card(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 150.0, vertical: 50.0),
                  child: Text("Job Roles"),
                ),
              ),
              const Card(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 150.0, vertical: 50.0),
                  child: Text("Job Roles"),
                ),
              ),

              ///---------------------------------------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: BtnBlack(
                  onpressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  },
                  btnText: "Go to Profile",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
