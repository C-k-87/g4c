import 'package:flutter/material.dart';
import 'package:g4c/domain/repositories/enumerations.dart';

void main() {
  runApp(PersonalityTest());
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
  @override
  Widget build(BuildContext context) {
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
                  Text('data'),
                ],
              ),
            );
          },
        ),
        const Text('data'),
      ],
    ));
  }
}

class Question {
  final String questionText;
  final String trait;

  Question({required this.questionText, required this.trait});
}

final List<Question> questions = [
  Question(
    questionText: "You find it easy to introduce yourself to other people.",
    trait: 'R',
  ),
  Question(
    questionText:
        "You often get so lost in thoughts that you ignore or forget your surroundings.",
    trait: 'I',
  ),
  Question(questionText: "Q3", trait: 'C'),
  Question(questionText: "Q4", trait: 'C'),
  Question(questionText: "Q5", trait: 'C'),
  Question(questionText: "Q6", trait: 'C'),
  Question(questionText: "Q7", trait: 'C'),
  Question(questionText: "Q8", trait: 'C'),
  // Add more questions as needed
];
