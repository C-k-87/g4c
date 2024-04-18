import 'package:flutter/material.dart';

class BtnSignInGoogle extends StatelessWidget {
  const BtnSignInGoogle({
    super.key,
    required this.onPressed,
  });
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          side: const BorderSide(
            width: 2.0,
            color: Colors.black87,
          )),
      child: const SizedBox(
          width: 160,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Image(
                  image: AssetImage('asset_lib/images/glogo.png'),
                  width: 20.0,
                ),
              ),
              Text('Sign in with Google'),
            ],
          )),
    );
  }
}
