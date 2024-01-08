import 'package:flutter/material.dart';
import 'package:g4c/asset_widgets.dart';

class ProfilePage extends StatelessWidget {
  final double fontsize = 15.0;

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            const TopCard(
              content: Image(
                fit: BoxFit.fill,
                image: AssetImage('asset_lib/images/back.png'),
              ),
              color: Color.fromARGB(255, 195, 255, 195),
            ),
            CardWidget(
              content: Container(),
              title: 'Personality Type',
              fontsize: fontsize,
            ),
            CardWidget(
              content: Container(),
              title: 'Traits',
              fontsize: fontsize,
            ),
            CardWidget(
              content: Container(),
              title: 'Skill Level',
              fontsize: fontsize,
            ),
          ],
        ),
      ],
    );
  }
}
