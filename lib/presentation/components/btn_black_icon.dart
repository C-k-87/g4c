import 'package:flutter/material.dart';

class BtnBlackIcon extends StatelessWidget {
  final Function()? onpressed;
  final String btnText;
  final IconData iconData;

  const BtnBlackIcon({
    super.key,
    required this.onpressed,
    required this.btnText,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      ),
      child: SizedBox(
        width: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(btnText),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(iconData),
            ),
          ],
        ),
      ),
    );
  }
}
