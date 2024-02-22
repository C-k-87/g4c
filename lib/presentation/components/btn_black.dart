import 'package:flutter/material.dart';

class BtnBlack extends StatelessWidget {
  final Function()? onpressed;
  final String btnText;
  final double? width;

  const BtnBlack({
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
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        padding:
            EdgeInsets.symmetric(horizontal: width ?? 80.0, vertical: 20.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width ?? 0),
        child: Text(btnText),
      ),
    );
  }
}
