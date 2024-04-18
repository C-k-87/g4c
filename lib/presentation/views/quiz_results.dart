import 'package:fl_chart/src/chart/base/base_chart/fl_touch_event.dart';
import 'package:fl_chart/src/chart/pie_chart/pie_chart_data.dart';
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
import 'package:g4c/presentation/views/loader.dart';

class QuizResults extends StatefulWidget {
  final QuizScores quizScores;
  late final Map<String, int> persList;

  QuizResults({super.key, required this.quizScores}) {
    persList = quizScores.getSortedScores();
  }

  @override
  State<QuizResults> createState() => _QuizResultsState();
}

class _QuizResultsState extends State<QuizResults> {
  TopCard? typeCard;
  Image? typeText;
  String? description;
  String? type;
  int touchedIndex = -1;

  @override
  void initState() {
    super.initState();
    typeCard = TopCard.factory(widget.persList.keys.last);
    typeText = setImage(widget.persList.keys.last);
    description = getDescription(widget.quizScores.getType());
    type = widget.quizScores.getType();
  }

  @override
  Widget build(BuildContext context) {
    List rolesList = [];
    return FutureBuilder(
        future: DataHandler().getRolesList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          } else if (snapshot.hasError) {
            return const ErrorScreen();
          } else {
            rolesList = snapshot.data;
            return Page(
              typeCard: typeCard!,
              typeText: typeText!,
              quizScores: widget.quizScores,
              rolesList: rolesList,
              touchCallback: touchCallback,
              description: description!,
              type: type!,
              touchedIndex: touchedIndex,
            );
          }
        });
  }

  void touchCallback(FlTouchEvent event, PieTouchResponse? touchResponse) {
    int index = -1;
    if (event.runtimeType == FlTapDownEvent && touchResponse != null) {
      print(event.toString());
      index = touchResponse.touchedSection!.touchedSectionIndex;
    }
    switch (index) {
      case 0:
        setState(() {
          type = "realistic";
          typeCard = TopCard.factory(type!);
          typeText = setImage(type!);
          description = getDescription(type!);
          touchedIndex = 0;
        });
        break;
      case 1:
        setState(() {
          type = "artistic";
          typeCard = TopCard.factory(type!);
          typeText = setImage(type!);
          description = getDescription(type!);
          touchedIndex = 1;
        });
        break;
      case 2:
        setState(() {
          type = "conventional";
          typeCard = TopCard.factory(type!);
          typeText = setImage(type!);
          description = getDescription(type!);
          touchedIndex = 2;
        });
        break;
      case 3:
        setState(() {
          type = "enterprising";
          typeCard = TopCard.factory(type!);
          typeText = setImage(type!);
          description = getDescription(type!);
          touchedIndex = 3;
        });
        break;
      case 4:
        setState(() {
          type = "investigative";
          typeCard = TopCard.factory(type!);
          typeText = setImage(type!);
          description = getDescription(type!);
          touchedIndex = 4;
        });
        break;
      case 5:
        setState(() {
          type = "social";
          typeCard = TopCard.factory(type!);
          typeText = setImage(type!);
          description = getDescription(type!);
          touchedIndex = 5;
        });
        break;
    }
  }
}

class Page extends StatelessWidget {
  const Page({
    super.key,
    required this.typeCard,
    required this.typeText,
    required this.quizScores,
    required this.rolesList,
    required this.touchCallback,
    required this.description,
    required this.type,
    required this.touchedIndex,
  });

  final TopCard typeCard;
  final Image typeText;
  final String description;
  final String type;
  final QuizScores quizScores;
  final List rolesList;
  final int touchedIndex;
  final void Function(FlTouchEvent event, PieTouchResponse? touchResponse)
      touchCallback;

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(
                    child: Legend(touchedIndex: touchedIndex,),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    child: PieChartWidget(
                      scores: quizScores.getScores(),
                      callback: touchCallback,
                      touchedIndex: touchedIndex,
                    ),
                  ),
                ],
              ),
              Center(
                child: heading("WHAT DOES THAT MEAN?"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: body(description),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: heading("Recommended jobs:"),
              ),
              ...createRecommendedRoles(rolesList, type),
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
}
