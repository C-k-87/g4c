import 'package:flutter/material.dart';
import 'package:g4c/g4c_drawer.dart';
import 'package:g4c/personality_quiz_runner.dart';

import 'asset_widgets.dart';

class PersonalityMain extends StatelessWidget {
  const PersonalityMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const G4CDrawer(),
      backgroundColor: const Color.fromARGB(255, 253, 254, 253),
      body: ListView(
        children: [
          const TopCard(
            content: Image(
              fit: BoxFit.fill,
              image: AssetImage('asset_lib/images/PersTestBacdropT.png'),
            ),
            color: Color.fromARGB(255, 195, 255, 195),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "DISCOVER YOUR",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "PERSONALITY",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: BtnBlack(
                  btnText: 'Take the Test',
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PersonalityQuizRunner()),
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "A Holland Code is a series of three letters that represents a person's three most dominant personality traits.\n\nParticipants complete the Self-Directed Search, which is a self-assessment tool that asks questions revolving around six distinct personality types.\n\nUpon completing the test, a person gets a specific code.\n\nAccording to the psychologist responsible for developing the theory, Dr. John Holland, knowing your three-digit personality code helps people develop self-awareness, find fulfillment and achieve career success.\n\nHere are the basic principles of Dr. Holland's theory:",
                  style: TextStyle(fontSize: 16),
                ),
                ListTile(
                  //leading: Icon(Icons.star),
                  title: Text(
                    "\u2022 On average, people fit into six specific personality types.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  //leading: Icon(Icons.numbers_outlined),
                  title: Text(
                    "\u2022 There are also six corresponding types of workplace environments.",
                    style: TextStyle(fontSize: 16),
                  ),
                  //titleTextStyle: TextStyle(fontSize: 33),
                ),
                ListTile(
                  //leading: Icon(Icons.numbers_outlined),
                  title: Text(
                    "\u2022 A person's actions, feelings and behaviors at work depend on how they fit in their environment.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  //leading: Icon(Icons.numbers_outlined),
                  title: Text(
                    "\u2022 People desire to find environments that allow for the expression of their values or environments that are suitable for using their unique skills.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  //leading: Icon(Icons.numbers_outlined),
                  title: Text(
                    "\u2022 People are most likely to feel fulfillment and find success in work environments that match their personalities.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
