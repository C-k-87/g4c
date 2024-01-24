import 'package:flutter/material.dart';
import 'package:g4c/g4c_drawer.dart';
import 'asset_widgets.dart';
import 'question_sets.dart';

class PersonalityQuizRunner extends StatefulWidget {
  const PersonalityQuizRunner({super.key});

  @override
  State<PersonalityQuizRunner> createState() => _PersonalityQuizRunnerState();
}

class _PersonalityQuizRunnerState extends State<PersonalityQuizRunner> {
  Widget questionSet = const QuestionSet1();
  int pageNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: const Text(
          'Page Title',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 195, 255, 195),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Image.asset(
              'asset_lib/images/G4C_logo_text.png',
              width: 50.0,
            ),
          ),
        ],
      ),
      drawer: const G4CDrawer(),
      body: ListView(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 700,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 195, 255, 195),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 10,
                          vertical: 10.0),
                      child: const Text(
                        'Choose your preference to each question from the ranges below',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'DISLIKE',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.circle,
                            size: 15,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'NEUTRAL',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.circle,
                            size: 15,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'LIKE',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              questionSet,
              const SizedBox(
                height: 20.0,
              ),
              Text("Step $pageNumber of 6 "),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: pageNumber == 1
                        ? const Icon(Icons.circle_rounded)
                        : const Icon(Icons.circle_outlined),
                    iconSize: 20,
                    onPressed: () {
                      setState(() {
                        questionSet = const QuestionSet1();
                        pageNumber = 1;
                      });
                    },
                  ),
                  IconButton(
                    icon: pageNumber == 2
                        ? const Icon(Icons.circle_rounded)
                        : const Icon(Icons.circle_outlined),
                    iconSize: 20,
                    onPressed: () {
                      setState(() {
                        questionSet = const QuestionSet2();
                        pageNumber = 2;
                      });
                    },
                  ),
                  IconButton(
                    icon: pageNumber == 3
                        ? const Icon(Icons.circle_rounded)
                        : const Icon(Icons.circle_outlined),
                    iconSize: 20,
                    onPressed: () {
                      setState(() {
                        //questionSet = const QuestionSet3();
                        pageNumber = 3;
                      });
                    },
                  ),
                  IconButton(
                    icon: pageNumber == 4
                        ? const Icon(Icons.circle_rounded)
                        : const Icon(Icons.circle_outlined),
                    iconSize: 20,
                    onPressed: () {
                      setState(() {
                        questionSet = const QuestionSet4();
                        pageNumber = 4;
                      });
                    },
                  ),
                  IconButton(
                    icon: pageNumber == 5
                        ? const Icon(Icons.circle_rounded)
                        : const Icon(Icons.circle_outlined),
                    iconSize: 20,
                    onPressed: () {
                      setState(() {
                        questionSet = const QuestionSet5();
                        pageNumber = 5;
                      });
                    },
                  ),
                  IconButton(
                    icon: pageNumber == 6
                        ? const Icon(Icons.circle_rounded)
                        : const Icon(Icons.circle_outlined),
                    iconSize: 20,
                    onPressed: () {
                      setState(() {
                        questionSet = const QuestionSet6();
                        pageNumber = 6;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              BtnBlackIcon(
                onpressed: () {
                  switch (pageNumber) {
                    case 1:
                      setState(() {
                        questionSet = const QuestionSet2();
                      });
                      break;
                    case 2:
                      setState(() {
                        questionSet = const QuestionSet3();
                      });
                      break;
                    case 3:
                      setState(() {
                        questionSet = const QuestionSet4();
                      });
                      break;
                    case 4:
                      setState(() {
                        questionSet = const QuestionSet5();
                      });
                      break;
                    case 5:
                      setState(() {
                        questionSet = const QuestionSet6();
                      });
                      break;
                    default:
                  }
                  pageNumber++;
                },
                btnText: 'Next',
                iconData: Icons.arrow_right_rounded,
              ),
              const SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
