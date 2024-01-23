import 'package:flutter/material.dart';
import 'package:g4c/main.dart';
import 'asset_widgets.dart';

class PersonalityQuiz1 extends StatelessWidget {
  const PersonalityQuiz1({super.key});
  /*QuizPrefBar(
          question: 'How do you feel about this statement?',
        ),*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 700,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 163, 249, 150),
                  ),
                  child: const Row(
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
                const SizedBox(
                  height: 20,
                ),
                const QuizPrefBar(
                  question: 'How do you feel about this statement?',
                ),
                const QuizPrefBar(
                  question: 'How do you feel about this statement?',
                ),
                const QuizPrefBar(
                  question: 'How do you feel about this statement?',
                ),
                const QuizPrefBar(
                  question: 'How do you feel about this statement?',
                ),
                const QuizPrefBar(
                  question: 'How do you feel about this statement?',
                ),
                const QuizPrefBar(
                  question: 'How do you feel about this statement?',
                ),
                const QuizPrefBar(
                  question: 'How do you feel about this statement?',
                ),
                const QuizPrefBar(
                  question: 'How do you feel about this statement?',
                ),
                const QuizPrefBar(
                  question: 'How do you feel about this statement?',
                ),
                const QuizPrefBar(
                  question: 'How do you feel about this statement?',
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text("Step 1 of 6 "),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.circle_outlined),
                      iconSize: 20,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePageTest(),
                          ),
                        );
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
                      onPressed: () {
                        /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePageTest(),
                      ),
                    );*/
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: BtnBlackIcon(
                    onpressed: () {},
                    btnText: 'Next',
                    iconData: Icons.logout,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
