import 'package:flutter/material.dart';
import 'package:g4c/asset_widgets.dart';

class G4CDrawer extends StatelessWidget {
  const G4CDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.green[100],
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black87,
                ),
                width: double.maxFinite,
                height: double.maxFinite,
                child: const Center(
                  child: Text(
                    'Header',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                BtnNavigation(
                    btnText: "Personality Quiz",
                    onPressed: () {},
                    iconData: Icons.search),
                BtnNavigation(
                    btnText: "Progress Tracker",
                    onPressed: () {},
                    iconData: Icons.trending_up),
                BtnNavigation(
                    btnText: "Job Roles",
                    onPressed: () {},
                    iconData: Icons.castle),
                BtnNavigation(
                    btnText: "Profile",
                    onPressed: () {},
                    iconData: Icons.supervised_user_circle),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: BtnBlackIcon(
                    onpressed: () {},
                    btnText: 'Logout',
                    iconData: Icons.logout,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
