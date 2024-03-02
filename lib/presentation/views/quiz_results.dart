import 'package:flutter/material.dart';
import 'package:g4c/data/entities/quiz_scores.dart';
import 'package:g4c/domain/repositories/type_descriptions.dart';
import 'package:g4c/domain/use_cases/create_roles_list.dart';
import 'package:g4c/domain/use_cases/data_handler.dart';
import 'package:g4c/domain/use_cases/routing.dart';
import 'package:g4c/domain/use_cases/set_image.dart';
import 'package:g4c/presentation/components/btn_black.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';
import 'package:g4c/presentation/components/legend.dart';
import 'package:g4c/presentation/components/pie_chart.dart';
import 'package:g4c/presentation/components/text_fields.dart';
import 'package:g4c/presentation/components/top_card.dart';

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
    List rolesList = [];

    return FutureBuilder(
        future: DataHandler().getRolesList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return const Scaffold(
              body: Icon(Icons.android),
            );
          } else {
            rolesList = snapshot.data;
            return Scaffold(
              appBar: G4CAppBar("Quiz Results", false),
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
                          const SizedBox(
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
                      ...createRecommendedRoles(
                          rolesList, quizScores.getType()),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: BtnBlack(
                          onpressed: () {
                            navtoProfilePage(context);
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
        });
  }
}
