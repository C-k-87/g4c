import 'package:flutter/material.dart';
import 'package:g4c/data/entities/course__detail_provider.dart';
import 'package:g4c/data/entities/data_provider.dart';
import 'package:g4c/domain/use_cases/data_handler.dart';
import 'package:g4c/domain/use_cases/routing.dart';
import 'package:g4c/domain/use_cases/sign_in.dart';
import 'package:g4c/presentation/components/btn_black.dart';
import 'package:g4c/presentation/components/btn_white.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';
import 'package:g4c/presentation/components/pwd_input.dart';
import 'package:g4c/presentation/components/top_card.dart';
import 'package:g4c/presentation/components/txt_input.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPwdVis = false;
  bool _isConfPwdVis = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final confPwdController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    pwdController.dispose();
    confPwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DataProvider provider = Provider.of<DataProvider>(context);
    CourseDetailProvider courseProvider =
        Provider.of<CourseDetailProvider>(context);

    return Scaffold(
      appBar: G4CAppBar('', false, login: true),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          clipBehavior: Clip.hardEdge,
          shrinkWrap: true,
          padding: null,
          children: [
            const SizedBox(
              child: TopCard(
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
            ),
            const SizedBox(
              height: 40.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "CREATE",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "YOUR PERSONA",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TxtInput(
                  fieldName: 'Full name',
                  controller: nameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                TxtInput(
                  fieldName: 'Email',
                  controller: emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                PwdInput(
                  fieldName: "Password",
                  isPasswordVisible: _isPwdVis,
                  onpressed: () {
                    setState(() {
                      _isPwdVis = !_isPwdVis;
                    });
                  },
                  controller: pwdController,
                ),
                const SizedBox(
                  height: 20,
                ),
                PwdInput(
                  fieldName: "Confirm Password",
                  isPasswordVisible: _isConfPwdVis,
                  onpressed: () {
                    setState(() {
                      _isConfPwdVis = !_isConfPwdVis;
                    });
                  },
                  controller: confPwdController,
                ),
                const SizedBox(
                  height: 40,
                ),
                BtnBlack(
                  btnText: 'Register',
                  onpressed: () {
                    String username = nameController.text;
                    String password = pwdController.text;
                    String email = emailController.text;

                    if (password == confPwdController.text) {
                      signUp(email, password, username, context).then(
                          (user) async {
                        if (user != null) {
                          DataHandler().initializeUserProfile(user);
                          await provider.refreshUserData(user.uid);
                          await courseProvider.refreshDegreeData(user.uid);
                        }
                        return user;
                      }).then((user) => user != null
                          ? navtoUserDetailEntry(context, user)
                          : ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("User not found"))));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Passwords do not match")));
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                BtnWhite(
                  btnText: 'Clear',
                  onpressed: () {
                    nameController.clear();
                    emailController.clear();
                    pwdController.clear();
                    confPwdController.clear();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
