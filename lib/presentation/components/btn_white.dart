import 'package:flutter/material.dart';

class BtnWhite extends StatelessWidget {
  final Function()? onpressed;
  final String btnText;
  final double? width;

  const BtnWhite({
    super.key,
    required this.onpressed,
    required this.btnText,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: EdgeInsets.symmetric(
            horizontal: width ?? 80.0,
            vertical: 20.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          side: const BorderSide(
            color: Colors.black,
            width: 2.0,
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width ?? 0),
        child: Text(btnText),
      ),
    );
  }
}
