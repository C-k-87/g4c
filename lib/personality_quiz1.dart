import 'package:flutter/material.dart';
import 'asset_widgets.dart';

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
                  color: Color.fromARGB(255, 163, 249, 150),
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
                    icon: const Icon(Icons.circle_outlined),
                    iconSize: 20,
                    onPressed: () {
                      /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePageTest(),
                    ),
                  );*/
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.circle_outlined),
                    iconSize: 20,
                    onPressed: () {
                      /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePageTest(),
                    ),
                  );*/
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.circle_outlined),
                    iconSize: 20,
                    onPressed: () {
                      /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePageTest(),
                    ),
                  );*/
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.circle_outlined),
                    iconSize: 20,
                    onPressed: () {},
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
                        //questionSet = const QuestionSet2();
                      });
                      break;
                    case 2:
                      setState(() {
                        //questionSet = QuestionSet3()
                      });
                      break;
                    case 3:
                      setState(() {
                        //questionSet = QuestionSet4()
                      });
                      break;
                    case 4:
                      setState(() {
                        //questionSet = QuestionSet5()
                      });
                      break;
                    case 5:
                      setState(() {
                        //questionSet = QuestionSet6()
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

class QuestionSet1 extends StatelessWidget {
  const QuestionSet1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        QuizPrefBar(
          question: 'Do you enjoy working with your hands and physical tasks?',
        ),
        QuizPrefBar(
          question:
              'Are you curious about how things work and enjoy solving complex problems?',
        ),
        QuizPrefBar(
          question:
              'Do you enjoy expressing yourself through creative activities such as drawing, writing, or performing arts?',
        ),
        QuizPrefBar(
          question:
              'Are you naturally inclined towards leadership roles and enjoy taking charge?',
        ),
        QuizPrefBar(
          question: 'Do you prefer well-organized and structured environments?',
        ),
      ],
    );
  }
}

class QuestionSet2 extends StatelessWidget {
  const QuestionSet2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        QuizPrefBar(
          question: 'Do you enjoy helping and interacting with people?',
        ),
        QuizPrefBar(
          question:
              'Are you interested in activities such as building, fixing, or assembling things?',
        ),
        QuizPrefBar(
          question:
              'Do you enjoy analyzing data, conducting experiments, or doing research?',
        ),
        QuizPrefBar(
          question:
              'Are you attracted to unique and unconventional ideas or approaches?',
        ),
        QuizPrefBar(
          question: 'Do you enjoy persuading, influencing, or managing others?',
        ),
      ],
    );
  }
}
