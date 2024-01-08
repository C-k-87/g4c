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

  get padding => null;

  @override
  Widget build(BuildContext context) {
    var themeCol1 = const Color.fromARGB(255, 195, 255, 195);
    return   Scaffold(
    appBar: AppBar(
      toolbarHeight: 180,
      backgroundColor: themeCol1,
        shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0),bottomLeft: Radius.circular(20.0))
        ),
        centerTitle: true, // Center the title (in this case, the image)
        title: Image.asset(
          'asset_lib/images/G4C_logo_transparent.png',
          width: 200.0,
        ),
    ),
    body: Padding(
            padding: const EdgeInsets.only(top:10),
            child: Column(children: [
            const Text("CREATE",style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold)),
            const Text("YOUR PERSONA",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight:FontWeight.w400)),
            const SizedBox(height: 20,),
            const TxtInput(
              fieldName: 'Full name',
            ),
            const SizedBox(height: 20,),
            const TxtInput(
              fieldName: 'Email',
            ),
            const SizedBox(height: 20,),
            TextField(
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                hintText: " Confirm Password",
              ),
            ),
             Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: BtnBlack(
                  btnText: 'Register',
                  onpressed: ( ) { },
                ),
            ),
          Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: BtnWhite(
                  btnText: 'Clear',
                  onpressed: () {},
                ),
              ),
            ],
          ),
        )
    );
  }
}