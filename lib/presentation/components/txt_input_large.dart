import 'package:flutter/material.dart';

class TxtInputLarge extends StatelessWidget {
  final String fieldName;
  final TextEditingController controller;
  final int maxLines;

  const TxtInputLarge({
    super.key,
    required this.fieldName,
    required this.maxLines,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: fieldName,
        border: const OutlineInputBorder(),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 50.0,
        ),
      ),
    );
  }
}
