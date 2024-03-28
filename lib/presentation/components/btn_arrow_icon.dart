import 'package:flutter/material.dart';

class BtnNavigation1 extends StatelessWidget {
  const BtnNavigation1({
    super.key,
    required this.onPressed,
    required this.iconData,
    this.iconSize = 20.0,
    this.buttonWidth = 40.0,
    this.buttonHeight = 20.0,
  });

  final Function()? onPressed;
  final IconData iconData;
  final double iconSize;
  final double buttonWidth;
  final double buttonHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black38,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: const BorderSide(
            width: 2.0,
            color: Colors.black38,
          ),
        ),
        child: SizedBox(
          width: buttonWidth,
          height: buttonHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Icon(
                  iconData,
                  size: iconSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
