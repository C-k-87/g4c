import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/btn_black.dart';
import 'package:g4c/presentation/components/btn_white.dart';
import 'package:g4c/presentation/components/pwd_input.dart';
import 'package:g4c/presentation/components/top_card.dart';
import 'package:g4c/presentation/components/txt_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordVisible1 = false;
  bool _isPasswordVisible2 = false;

  final col1 = const Color.fromARGB(255, 195, 255, 195);
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: col1,
        toolbarHeight: 35.0,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          clipBehavior: Clip.hardEdge,
          shrinkWrap: true,
          padding: null,
          children: [
            SizedBox(
              child: TopCard(
                content: const Center(
                  child: Image(
                    image: AssetImage(
                      'asset_lib/images/G4C_logo_transparent.png',
                    ),
                    width: 200.0,
                  ),
                ),
                color: col1,
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
                  isPasswordVisible: _isPasswordVisible1,
                  onpressed: () {
                    setState(() {
                      _isPasswordVisible1 = !_isPasswordVisible1;
                    });
                  },
                  controller: pwdController,
                ),
                const SizedBox(
                  height: 20,
                ),
                PwdInput(
                  fieldName: "Confirm Password",
                  isPasswordVisible: _isPasswordVisible2,
                  onpressed: () {
                    setState(() {
                      _isPasswordVisible2 = !_isPasswordVisible2;
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
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Text(
                              'Name: ${nameController.text}\nEmail: ${emailController.text}'),
                        );
                      },
                    );
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
