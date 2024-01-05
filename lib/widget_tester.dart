import 'package:flutter/material.dart';
import 'asset_widgets.dart';

class WidgetTester extends StatelessWidget {
  const WidgetTester({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            BtnWhite(
              btnText: 'Button2',
              onpressed: () {},
            ),
            BtnBlack(
              onpressed: () {},
              btnText: "Button 1",
            ),
            BtnSignInGoogle(
              onPressed: () {},
            ),
            BtnNavigation(
              btnText: 'Personality',
              onPressed: () {},
              iconData: Icons.search,
            ),
            BtnBlackIcon(
              onpressed: () {},
              btnText: 'Logout',
              iconData: Icons.logout,
            ),
            const TxtInput(
              fieldName: 'Full name',
            ),
            const TxtSearch(
              fieldName: 'Search your role',
            ),
            const CardWidget(
              content: Center(
                child: Text(''),
              ),
              title: 'Card',
            ),
          ],
        ),
      ),
    );
  }
}
