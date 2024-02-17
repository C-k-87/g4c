import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g4c/domain/repositories/enumerations.dart';

void main() {
  runApp(const PersonalityTest());
}

class PersonalityTest extends StatelessWidget {
  const PersonalityTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PersTestRunner(),
    );
  }
}

class PersTestRunner extends StatefulWidget {
  const PersTestRunner({super.key});

  @override
  State<PersTestRunner> createState() => _PersTestRunnerState();
}

class _PersTestRunnerState extends State<PersTestRunner> {
  Map<int, Preference> _selectedOptions = {};
  List questionData = [];

  Future<void> readFile() async {
    final String resp = await rootBundle
        .loadString('lib/data/data_sources/json/questions.json');
    final data = await jsonDecode(resp);

    setState(() {
      questionData = data["questions"];
    });
  }

  List<Question> generateQlist() {
    List<Question> questionList = [];

    readFile();

    for (var question in questionData) {
      questionList.add(
          Question(questionText: question["text"], trait: question["trait"]));
    }
    return questionList;
  }

  @override
  Widget build(BuildContext context) {
    final List<Question> questions = generateQlist();

    return Scaffold(
        body: ListView(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: questions.length,
          itemBuilder: (context, index) {
            final question = questions[index];
            return Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(question.questionText,
                        textAlign: TextAlign.center),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Agree'),
                      ...List.generate(
                        5,
                        (i) => Radio(
                          value: switch (i) {
                            0 => Preference.agree,
                            1 => Preference.tolerate,
                            2 => Preference.neutral,
                            3 => Preference.avoid,
                            4 => Preference.disagree,
                            int() => null,
                          },
                          groupValue: _selectedOptions[index],
                          onChanged: (value) {
                            setState(() {
                              _selectedOptions[index] = value!;
                            });
                          },
                        ),
                      ),
                      const Text('Disagree'),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            calc(_selectedOptions, questions);
          },
          child: const Text('Calculate'),
        ),
      ],
    ));
  }
}

class Question {
  final String questionText;
  final String trait;

  Question({required this.questionText, required this.trait});
}

// final List<Question> questions = [
//   Question(
//     questionText: "You find it easy to introduce yourself to other people.",
//     trait: 'R',
//   ),
//   Question(
//     questionText:
//         "You often get so lost in thoughts that you ignore or forget your surroundings.",
//     trait: 'R',
//   ),
//   Question(questionText: "Q3", trait: 'R'),
//   Question(questionText: "Q4", trait: 'R'),
//   Question(questionText: "Q5", trait: 'R'),
//   Question(questionText: "Q6", trait: 'R'),
//   Question(questionText: "Q7", trait: 'R'),
//   Question(questionText: "Q8", trait: 'R'),
//   // Add more questions as needed
// ];

void calc(Map<int, Preference> map, List<Question> questions) {
  int rscore = 0;
  int iscore = 0;
  int cscore = 0;

  for (var preference in map.entries) {
    var score = switch (preference.value) {
      Preference.disagree => -2,
      Preference.avoid => -1,
      Preference.neutral => 0,
      Preference.tolerate => 1,
      Preference.agree => 2,
    };
    switch (questions[preference.key].trait) {
      case 'R':
        rscore += score;
        print('added $score to rscore');
        break;
      case 'I':
        iscore += score;
        print('added $score to iscore');
        break;
      case 'C':
        cscore += score;
        print('added $score to cscore');
        break;
    }
  }
  print('rscore: $rscore, iscore: $iscore, cscore: $cscore');
}
