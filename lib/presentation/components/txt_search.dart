import 'package:flutter/material.dart';

class TxtSearch extends StatelessWidget {
  final String fieldName;
  final Function(String)? onChanged;

  const TxtSearch({
    super.key,
    required this.fieldName,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: fieldName,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        constraints: const BoxConstraints(
          maxWidth: 400.0,
        ),
      ),
    );
  }
}
