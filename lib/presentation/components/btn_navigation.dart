import 'package:flutter/material.dart';

class BtnNavigation extends StatelessWidget {
  const BtnNavigation({
    super.key,
    required this.btnText,
    required this.onPressed,
    required this.iconData,
  });

  final String btnText;
  final Function()? onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            side: const BorderSide(
              width: 2.0,
              color: Colors.black87,
            )),
        child: SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: Icon(iconData)),
                Text(btnText),
              ],
            )),
      ),
    );
  }
}
