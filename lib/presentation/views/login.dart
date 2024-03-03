import 'package:flutter/material.dart';
import 'package:g4c/domain/use_cases/routing.dart';
import 'package:g4c/domain/use_cases/firestore_sp.dart';
import 'package:g4c/domain/use_cases/sign_in.dart';
import 'package:g4c/presentation/components/btn_black.dart';
import 'package:g4c/presentation/components/btn_sign_in_google.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';
import 'package:g4c/presentation/components/pwd_input.dart';
import 'package:g4c/presentation/components/top_card.dart';
import 'package:g4c/presentation/components/txt_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  // final FirebaseAuthService auth = FirebaseAuthService();
  // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
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
      appBar: G4CAppBar('', false, login: true),
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
                  onpressed: () async {
                    String uname = unameController.text.trim();
                    String pwd = pwdController.text;
                    await signIn(uname, pwd).then((user) async {
                      if (user != null) {
                        bool registered = await isRegistered(user.uid);
                        if (registered) {
                          setPrefs(user);
                        } else {
                          initializeUserProfile(user);
                        }
                        return registered;
                      }
                      throw (Exception("User not found"));
                    }).then(
                      (isRegistered) => isRegistered
                          ? navtoProfilePage(context)
                          : navtoUserDetailEntry(context),
                    );
                  },
                  btnText: 'Sign In',
                ),
                const SizedBox(height: 20.0),
                BtnSignInGoogle(onPressed: () async {
                  await signInWithGoogle().then((user) async {
                    if (user != null) {
                      bool registered = await isRegistered(user.uid);
                      if (registered) {
                        setPrefs(user);
                      } else {
                        initializeUserProfile(user);
                      }
                      return registered;
                    }
                    throw (Exception("User not found"));
                  }).then(
                    (isRegistered) => isRegistered
                        ? navtoProfilePage(context)
                        : navtoUserDetailEntry(context),
                  );
                }),
                const SizedBox(height: 30.0),
                TextButton(
                  onPressed: () {
                    navtoRegistration(context);
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
