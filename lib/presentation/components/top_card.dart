import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  final Widget content;
  final Color color;
  const TopCard({
    super.key,
    required this.content,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    List<double> resolution = [
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height
    ];
    double aspectRatio = resolution[0] / resolution[1];
    return Container(
      clipBehavior: Clip.hardEdge,
      height: (aspectRatio < 0.5 ? resolution[1] / 3.7 : resolution[1] / 2.0),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 0),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
      child: content,
    );
  }
}
