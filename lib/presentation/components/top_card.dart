import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  final Widget content;
  final Color color;
  const TopCard({
    super.key,
    required this.content,
    required this.color,
  });

  const TopCard.artistic({
    super.key,
    this.content = const Image(
      image: AssetImage('asset_lib/images/personalityimages/A.png'),
      fit: BoxFit.cover,
    ),
    this.color = const Color.fromARGB(255, 255, 255, 255),
  });

  factory TopCard.factory(String trait) {
    switch (trait) {
      case "artistic":
        return const TopCard.artistic();
      case "conventional":
        return const TopCard.conventional();
      case "enterprising":
        return const TopCard.enterprising();
      case "investigative":
        return const TopCard.investigative();
      case "realistic":
        return const TopCard.realistic();
      case "social":
        return const TopCard.social();
      default:
        return const TopCard(
            content: Text("There should be an image here"),
            color: Colors.green);
    }
  }

  const TopCard.conventional({
    super.key,
    this.content = const Image(
      image: AssetImage('asset_lib/images/personalityimages/C.png'),
      fit: BoxFit.cover,
    ),
    this.color = const Color.fromARGB(255, 255, 255, 255),
  });

  const TopCard.enterprising({
    super.key,
    this.content = const Image(
      image: AssetImage('asset_lib/images/personalityimages/E.png'),
      fit: BoxFit.cover,
    ),
    this.color = const Color.fromARGB(255, 255, 255, 255),
  });

  const TopCard.investigative({
    super.key,
    this.content = const Image(
      image: AssetImage('asset_lib/images/personalityimages/I.png'),
      fit: BoxFit.cover,
    ),
    this.color = const Color.fromARGB(255, 255, 255, 255),
  });

  const TopCard.realistic({
    super.key,
    this.content = const Image(
      image: AssetImage('asset_lib/images/personalityimages/R.png'),
      fit: BoxFit.cover,
    ),
    this.color = const Color.fromARGB(255, 255, 255, 255),
  });

  const TopCard.social({
    super.key,
    this.content = const Image(
      image: AssetImage('asset_lib/images/personalityimages/S.png'),
      fit: BoxFit.cover,
    ),
    this.color = const Color.fromARGB(255, 255, 255, 255),
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
