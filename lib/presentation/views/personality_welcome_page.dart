import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/btn_black_icon.dart';

class WelcomePagePersonality extends StatelessWidget {
  const WelcomePagePersonality({super.key});

  @override
  Widget build(BuildContext context) {
    String name = 'username';

    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage('asset_lib/images/Top Bar.jpg'),
            width: 1700,
            height: 2000,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Hello $name !',
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
                height: 90,
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
        ],
      ),
    );
  }
}
