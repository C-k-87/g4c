import 'package:flutter/material.dart';
import 'package:g4c/asset_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: ListView(
          clipBehavior: Clip.hardEdge,
          shrinkWrap: true,
          padding: null,
          children: [
            const TopCard(
              image: AssetImage(
                'asset_lib/images/G4C_logo_transparent.png',
              ),
              color: Color.fromARGB(255, 195, 255, 195),
            ),
            const SizedBox(
              height: 20.0,
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
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TxtInput(
                  fieldName: 'Full name',
                ),
                const SizedBox(
                  height: 20,
                ),
                const TxtInput(
                  fieldName: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                PwdInput(
                  fieldName: "Password",
                  isPasswordVisible: _isPasswordVisible,
                  onpressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                PwdInput(
                  fieldName: "Confirm Password",
                  isPasswordVisible: _isPasswordVisible,
                  onpressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: BtnBlack(
                    btnText: 'Register',
                    onpressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: BtnWhite(
                    btnText: 'Clear',
                    onpressed: () {},
                  ),
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
