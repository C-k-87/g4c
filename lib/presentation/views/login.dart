import 'package:flutter/material.dart';
import 'package:g4c/data/data_sources/firebase_auth_services.dart';
import 'package:g4c/domain/use_cases/routing.dart';
import 'package:g4c/presentation/components/btn_black.dart';
import 'package:g4c/presentation/components/btn_sign_in_google.dart';
import 'package:g4c/presentation/components/pwd_input.dart';
import 'package:g4c/presentation/components/top_card.dart';
import 'package:g4c/presentation/components/txt_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
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
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 195, 255, 195),
          toolbarHeight: 35.0),
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
                    await _signIn(uname, pwd).then((value) {
                      print(value?.displayName);
                      print(value?.email);
                    }).then((value) =>
                        value != null ? navtoProfilePage(context) : null);
                  },
                  btnText: 'Sign In',
                ),
                const SizedBox(height: 20.0),
                BtnSignInGoogle(onPressed: () async {
                  await _signInWithGoogle().then((value) {
                    setUserProfile(value);
                    return value;
                  }).then((value) =>
                      value != null ? navtoProfilePage(context) : null);
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

  Future<User?> _signIn(String email, String password) async {
    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isSignedIn', true);
      return user;
    } else {}
    return null;
  }

  Future<User?> _signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId:
            "565471500049-too7gv7ufbarpssak0itep2035cm8kvv.apps.googleusercontent.com");
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        final UserCredential authResult =
            await _firebaseAuth.signInWithCredential(credential);
        final User? user = authResult.user;
        print("Got user ${user?.email}. Hello ${user?.displayName}");
        return user;
      }
    } catch (e) {
      print("Sign in failed : ${e.toString()}");
    }

    return null;
  }

  void setUserProfile(User? user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (user != null) {
      prefs.setString('name', user.displayName ?? user.uid);
      prefs.setString('uid', user.uid);
      prefs.setString('email', user.email ?? "");
      prefs.setString(
          'imageURL',
          user.photoURL ??
              "https://static.vecteezy.com/system/resources/previews/005/129/844/non_2x/profile-user-icon-isolated-on-white-background-eps10-free-vector.jpg");
    }
  }
}
