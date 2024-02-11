import 'package:flutter/material.dart';

class BtnBlack extends StatelessWidget {
  final Function()? onpressed;
  final String btnText;

  const BtnBlack({
    super.key,
    required this.onpressed,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      ),
      child: Text(btnText),
    );
  }
}
