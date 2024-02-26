import 'package:flutter/material.dart';
import 'package:g4c/data/data_sources/firebase_auth_services.dart';
import 'package:g4c/presentation/components/btn_black.dart';
import 'package:g4c/presentation/components/btn_sign_in_google.dart';
import 'package:g4c/presentation/components/pwd_input.dart';
import 'package:g4c/presentation/components/top_card.dart';
import 'package:g4c/presentation/components/txt_input.dart';
import 'package:g4c/presentation/views/profile_page.dart';
import 'package:g4c/presentation/views/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:g4c/presentation/views/user_info.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:g4c/presentation/components/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
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

                    _signIn();
                  },
                  btnText: 'Sign In',
                ),
                const SizedBox(height: 20.0),
                BtnSignInGoogle(onPressed: () {
                  _signInWithGoogle();
                }),
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

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = unameController.text;
    String password = pwdController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: "User is successfully signed in");
      String username = email.split('@')[0];
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserDetails(username: username),
        ),
      );
    } else {
      showToast(message: "some error occured");
    }
  }

  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        final User? user = userCredential.user;

        if (user != null) {
          String? displayName = user.displayName;
          String username =
              displayName ?? googleSignInAccount.displayName ?? '';

          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDetails(username: username),
            ),
          );
        }
      }
    } catch (e) {
      showToast(message: "some error occured $e");
    }
  }
}
