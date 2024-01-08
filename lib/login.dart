import 'package:flutter/material.dart';
import 'asset_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  height: 70.0,
                  child: null,
                ),
                Column(
                  children: [
                    const Text(
                      'STEP IN',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'TO YOUR FUTURE',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(
                      height: 70.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TxtInput(
                        fieldName: 'Username',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TxtInput(fieldName: 'Password'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: BtnBlack(onpressed: () {}, btnText: 'Sign In'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: BtnSignInGoogle(onPressed: () {}),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Don't have an account yet?",
                        style: TextStyle(
                          color: Colors.blue[700],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
