import 'package:flutter/material.dart';

class TxtInput extends StatelessWidget {
  final String fieldName;
  final TextEditingController controller;

  const TxtInput({
    super.key,
    required this.fieldName,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: fieldName,
        border: const UnderlineInputBorder(),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 50.0,
        ),
      ),
    );
  }
}
