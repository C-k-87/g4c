import 'package:flutter/material.dart';

class BtnWhite extends StatelessWidget {
  final Function()? onpressed;
  final String btnText;

  const BtnWhite({
    super.key,
    required this.onpressed,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(
            horizontal: 80.0,
            vertical: 20.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          side: const BorderSide(
            color: Colors.black,
            width: 2.0,
          )),
      child: Text(btnText),
    );
  }
}
