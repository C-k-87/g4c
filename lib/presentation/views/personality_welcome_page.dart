import 'package:flutter/material.dart';
import 'package:g4c/domain/use_cases/routing.dart';
import 'package:g4c/presentation/components/btn_black_icon.dart';
import 'package:g4c/presentation/components/top_card.dart';

class WelcomePagePersonality extends StatelessWidget {
  const WelcomePagePersonality({Key? key});

  @override
  Widget build(BuildContext context) {
    String name = 'username';

    return Scaffold(
      body: Stack(
        children: [
          const TopCard(
            content: Center(
              child: Image(
                image: AssetImage(
                  'asset_lib/images/G4C_logo_transparent.png',
                ),
                width: 200.0,
              ),
            ),
            color: Color.fromARGB(255, 195, 255, 195),
          ),
          const SizedBox(
            // Remove the extra comma here
            height: 40.0,
          ),
          Column(
            children: [
              const SizedBox(
                height: 300,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '     Hello \n$name !',
                  style: const TextStyle(color: Colors.black, fontSize: 40),
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Let Us Discover\n"
                  "Your Personality",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: BtnBlackIcon(
                  onpressed: () {
                    navtoQuizRunner(context, initial: true);
                  },
                  btnText: 'Next',
                  iconData: Icons.logout,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
