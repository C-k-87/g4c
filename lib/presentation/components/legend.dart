import 'package:flutter/material.dart';
import 'package:g4c/domain/repositories/trait_colors.dart';

class Legend extends StatelessWidget {
  final int touchedIndex;

  const Legend({super.key, required this.touchedIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // children: [
        //   Row(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //         child: Icon(
        //           Icons.square_rounded,
        //           color: traitColors['artistic'],
        //         ),
        //       ),
        //       const Text(
        //         "Artistic",
        //         // style: TextStyle(
        //         //   color: traitColors['artistic'],
        //         //   shadows: const [
        //         //     Shadow(color: Colors.black12, blurRadius: 1.5)
        //         //   ],
        //         // ),
        //       ),
        //     ],
        //   ),
        //   Row(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //         child: Icon(
        //           Icons.square_rounded,
        //           color: traitColors['conventional'],
        //         ),
        //       ),
        //       const Text(
        //         "Conventional",
        //         // style: TextStyle(
        //         //   color: traitColors['conventional'],
        //         //   shadows: const [
        //         //     Shadow(color: Colors.black12, blurRadius: 1.5)
        //         //   ],
        //         // ),
        //       ),
        //     ],
        //   ),
        //   Row(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //         child: Icon(
        //           Icons.square_rounded,
        //           color: traitColors['enterprising'],
        //         ),
        //       ),
        //       const Text(
        //         "Enterprising",
        //         // style: TextStyle(
        //         //   color: traitColors['enterprising'],
        //         //   shadows: const [
        //         //     Shadow(color: Colors.black12, blurRadius: 1.5)
        //         //   ],
        //         // ),
        //       ),
        //     ],
        //   ),
        //   Row(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //         child: Icon(
        //           Icons.square_rounded,
        //           color: traitColors['investigative'],
        //         ),
        //       ),
        //       const Text(
        //         "Investigative",
        //         // style: TextStyle(
        //         //   color: traitColors['investigative'],
        //         //   shadows: const [
        //         //     Shadow(color: Colors.black12, blurRadius: 1.5)
        //         //   ],
        //         // ),
        //       ),
        //     ],
        //   ),
        //   Row(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //         child: Icon(
        //           Icons.square_rounded,
        //           color: traitColors['social'],
        //         ),
        //       ),
        //       const Text(
        //         "Social",
        //         // style: TextStyle(
        //         //   color: traitColors['social'],
        //         //   shadows: const [
        //         //     Shadow(color: Colors.black12, blurRadius: 1.5)
        //         //   ],
        //         // ),
        //       ),
        //     ],
        //   ),
        //   Row(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //         child: Icon(
        //           Icons.square_rounded,
        //           color: traitColors['realistic'],
        //         ),
        //       ),
        //       const Text(
        //         "Realistic",
        //         // style: TextStyle(
        //         //   color: traitColors['realistic'],
        //         //   shadows: const [
        //         //     Shadow(color: Colors.black12, blurRadius: 1.5)
        //         //   ],
        //         // ),
        //       ),
        //     ],
        //   ),
        // ],
        children: [
          ...List.generate(6, (index) {
            var traits = [
              "Realistic",
              "Artistic",
              "Conventional",
              "Enterprising",
              "Investigative",
              "Social"
            ];
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.square_rounded,
                    color: traitColors[traits[index].toLowerCase()],
                  ),
                ),
                Text(
                  traits[index],
                  textScaler: touchedIndex == index
                      ? const TextScaler.linear(1.4)
                      : null,
                  style: touchedIndex == index
                      ? const TextStyle(fontWeight: FontWeight.w600)
                      : null,
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
