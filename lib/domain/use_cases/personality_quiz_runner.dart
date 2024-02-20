import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g4c/data/entities/question.dart';
import 'package:g4c/domain/repositories/enumerations.dart';
import 'package:g4c/presentation/components/btn_black.dart';
import 'package:g4c/presentation/components/btn_white.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';

class PersonalityQuizRunner extends StatefulWidget {
  const PersonalityQuizRunner({super.key});

  @override
  State<PersonalityQuizRunner> createState() => _PersonalityQuizRunnerState();
}

class _PersonalityQuizRunnerState extends State<PersonalityQuizRunner> {
  List<Preference> selectedOptions =
      List.generate(11, (index) => Preference.neutral);
  List<Question> questionData = [Question(questionText: "loading", trait: '0')];
  int questionNumber = 0;

  Future<void> readFile() async {
    final String resp = await rootBundle
        .loadString('lib/data/data_sources/json/questions.json');
    final data = await jsonDecode(resp);

    for (var element in data["questions"]) {
      questionData.add(
        Question(questionText: element["text"], trait: element["trait"]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questionData.length == 1) {
      readFile().whenComplete(() => setState(() {
            questionNumber = 1;
          }));
    }
    return Scaffold(
      appBar: G4CAppBar('Profile Page', true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  // color:
                  //     const Color.fromARGB(255, 161, 238, 163).withOpacity(0.3),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.0),
                ),
                child: Text(
                  questionNumber.toString(),
                  style: const TextStyle(fontSize: 20.0),
                ),
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
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: questionNumber == 1 ? false : true,
                child: BtnWhite(
                  onpressed: previousQuestion,
                  btnText: questionNumber == 1 ? '' : 'Previous',
                  width: 20.0,
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              BtnBlack(
                onpressed: nextQuestion,
                btnText: questionNumber == questionData.length - 1
                    ? 'Submit'
                    : 'Next',
                width: 15.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  prefButton(Preference pref, Color color, void Function() callback) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: InkWell(
        splashColor: color,
        borderRadius: BorderRadius.circular(15.0),
        splashFactory: InkRipple.splashFactory,
        onTap: callback,
        child: selectedOptions[questionNumber] == pref
            ? Icon(
                Icons.circle_rounded,
                size: 30.0,
                color: color,
              )
            : Icon(
                Icons.circle_outlined,
                size: 30.0,
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
    if (questionNumber == 1) {
      // print("No more");
    } else {
      setState(() {
        questionNumber--;
      });
    }
  }

  nextQuestion() {
    if (questionNumber == questionData.length - 1) {
      // print("Submit");
    } else {
      setState(() {
        questionNumber++;
      });
    }
  }
}
