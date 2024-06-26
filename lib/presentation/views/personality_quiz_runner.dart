import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g4c/data/entities/question.dart';
import 'package:g4c/data/entities/quiz_scores.dart';
import 'package:g4c/domain/repositories/enumerations.dart';
import 'package:g4c/domain/use_cases/data_handler.dart';
import 'package:g4c/domain/use_cases/routing.dart';
import 'package:g4c/presentation/components/btn_black.dart';
import 'package:g4c/presentation/components/btn_white.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';
import 'package:g4c/presentation/views/loader.dart';

class PersonalityQuizRunner extends StatefulWidget {
  const PersonalityQuizRunner({super.key});

  @override
  State<PersonalityQuizRunner> createState() => _PersonalityQuizRunnerState();
}

class _PersonalityQuizRunnerState extends State<PersonalityQuizRunner> {
  int questionNumber = 0;
  List<Question> questionData = [];
  List<Preference> selectedOptions =
      List.generate(30, (index) => Preference.na);
  QuizScores? quizScores;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readRoleList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        } else if (snapshot.hasError) {
          return const ErrorScreen();
        } else {
          return Scaffold(
            appBar: G4CAppBar('Personality Quiz', true),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: const Alignment(0, 0),
                      children: [
                        SizedBox(
                          height: 90.0,
                          width: 90.0,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.green.shade100,
                            color: Colors.green,
                            value: ((questionNumber + 1) / questionData.length),
                          ),
                        ),
                        Text(
                          (questionNumber + 1).toString(),
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        questionData[questionNumber].getQuestion(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "DISAGREE",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                        prefButton(
                          Preference.disagree,
                          Colors.red.shade400,
                          callback(Preference.disagree),
                        ),
                        prefButton(
                          Preference.avoid,
                          Colors.amber.shade400,
                          callback(Preference.avoid),
                        ),
                        prefButton(
                          Preference.neutral,
                          Colors.yellow.shade200,
                          callback(Preference.neutral),
                        ),
                        prefButton(
                          Preference.tolerate,
                          Colors.green.shade200,
                          callback(Preference.tolerate),
                        ),
                        prefButton(
                          Preference.agree,
                          Colors.green,
                          callback(Preference.agree),
                        ),
                        Text(
                          "AGREE",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: questionNumber == 0 ? false : true,
                      child: BtnWhite(
                        onpressed: previousQuestion,
                        btnText: 'Previous',
                        width: 15.0,
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Visibility(
                      visible: selectedOptions[questionNumber] == Preference.na
                          ? false
                          : true,
                      child: BtnBlack(
                        onpressed: questionNumber == questionData.length - 1
                            ? () {
                                submit().whenComplete(
                                  () => navtoQuizResults(
                                    context,
                                    quizScores ?? QuizScores(0, 0, 0, 0, 0, 0),
                                  ),
                                );
                              }
                            : nextQuestion,
                        btnText: questionNumber == questionData.length - 1
                            ? 'Submit'
                            : 'Next',
                        width: 20.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }

  prefButton(Preference pref, Color color, void Function() callback) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: (MediaQuery.of(context).size.width / 40)),
      child: InkWell(
        splashColor: color,
        onTap: callback,
        child: selectedOptions[questionNumber] == pref
            ? Icon(
                Icons.square_rounded,
                size: 35.0,
                color: color,
              )
            : Icon(
                Icons.square_outlined,
                size: 35.0,
                color: color,
              ),
      ),
    );
  }

  void Function() callback(Preference pref) {
    return () {
      selectedOptions[questionNumber] = pref;
      nextQuestion();
    };
  }

  previousQuestion() {
    if (questionNumber == 0) {
      // print("No more");
    } else {
      setState(() {
        questionNumber--;
      });
    }
  }

  nextQuestion() {
    if (questionNumber == questionData.length - 1) {
      setState(() {});
    } else {
      setState(() {
        questionNumber++;
      });
    }
  }

  Future<void> readRoleList() async {
    if (questionData.isEmpty) {
      final String resp = await rootBundle
          .loadString('lib/data/data_sources/json/questions.json');
      final data = await jsonDecode(resp);

      for (var element in data["questions"]) {
        questionData.add(
          Question(questionText: element["text"], trait: element["trait"]),
        );
      }
    }
  }

  Future<void> submit() async {
    int ascore = 0;
    int cscore = 0;
    int escore = 0;
    int iscore = 0;
    int rscore = 0;
    int sscore = 0;

    for (var i = 0; i < questionData.length; i++) {
      int prefscore = 0;

      switch (selectedOptions[i]) {
        case Preference.disagree:
          prefscore = -2;
          break;
        case Preference.avoid:
          prefscore = -1;
          break;
        case Preference.neutral:
          prefscore = 0;
          break;
        case Preference.tolerate:
          prefscore = 1;
          break;
        case Preference.agree:
          prefscore = 2;
          break;
        default:
      }
      switch (questionData[i].trait) {
        case 'A':
          ascore += prefscore;
          break;
        case 'C':
          cscore += prefscore;
          break;
        case 'E':
          escore += prefscore;
          break;
        case 'I':
          iscore += prefscore;
          break;
        case 'R':
          rscore += prefscore;
          break;
        case 'S':
          sscore += prefscore;
          break;
      }
    }

    QuizScores results =
        QuizScores(ascore, cscore, escore, iscore, rscore, sscore);

    await DataHandler().updateQuizResults(results, context);

    setState(() {
      quizScores = results;
    });
  }
}
