import 'package:flutter/material.dart';
import 'package:g4c/domain/repositories/trait_colors.dart';

class Legend extends StatelessWidget {
  const Legend({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.square_rounded,
              color: traitColors['artistic'],
            ),
            Text(
              "Artistic",
              style: TextStyle(color: traitColors['artistic']),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.square_rounded,
              color: traitColors['conventional'],
            ),
            Text(
              "Conventional",
              style: TextStyle(color: traitColors['conventional']),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.square_rounded,
              color: traitColors['enterprising'],
            ),
            Text(
              "Enterprising",
              style: TextStyle(color: traitColors['enterprising']),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.square_rounded,
              color: traitColors['investigative'],
            ),
            Text(
              "Investigative",
              style: TextStyle(color: traitColors['investigative']),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.square_rounded,
              color: traitColors['social'],
            ),
            Text(
              "Social",
              style: TextStyle(color: traitColors['social']),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.square_rounded,
              color: traitColors['realistic'],
            ),
            Text(
              "Realistic",
              style: TextStyle(color: traitColors['realistic']),
            ),
          ],
        ),
      ],
    );
  }
}
