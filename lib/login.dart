import 'package:flutter/material.dart';
import 'package:g4c/profile_page.dart';
import 'package:g4c/register.dart';
import 'asset_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final col1 = const Color.fromARGB(255, 195, 255, 195);
  final unameController = TextEditingController();
  final pwdController = TextEditingController();

  @override
  void dispose() {
    unameController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: col1, toolbarHeight: 35.0),
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
                const SizedBox(height: 70.0),
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
                const SizedBox(height: 50.0),
                TxtInput(
                  fieldName: 'Username',
                  controller: unameController,
                ),
                const SizedBox(height: 50.0),
                PwdInput(
                  fieldName: 'Password',
                  isPasswordVisible: _isPasswordVisible,
                  onpressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  controller: pwdController,
                ),
                const SizedBox(height: 50.0),
                BtnBlack(
                  onpressed: () {
                    String uname = unameController.text.trim();
                    String pwd = pwdController.text;

                    if ((uname == "test") && (pwd == "123")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            // Retrieve the text the that user has entered by using the
                            // TextEditingController.
                            content: Text(
                                'invalid login details. try uname: test pwd:123'),
                          );
                        },
                      );
                    }
                  },
                  btnText: 'Sign In',
                ),
                const SizedBox(height: 20.0),
                BtnSignInGoogle(onPressed: () {}),
                const SizedBox(height: 30.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Don't have an account yet?",
                    style: TextStyle(
                      color: Colors.blue[700],
                    ),
                  ),
                ),
                const SizedBox(height: 30.0)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
