import 'package:flutter/material.dart';

class PwdInput extends StatelessWidget {
  final String fieldName;
  final bool isPasswordVisible;
  final TextEditingController controller;
  final Function()? onpressed;

  const PwdInput({
    super.key,
    required this.fieldName,
    required this.isPasswordVisible,
    this.onpressed,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !isPasswordVisible,
      controller: controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 50.0,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: onpressed,
        ),
        hintText: fieldName,
      ),
    );
  }
}
