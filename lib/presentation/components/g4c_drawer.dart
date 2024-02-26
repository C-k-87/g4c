import 'package:flutter/material.dart';
import 'package:g4c/domain/use_cases/routing.dart';
import 'package:g4c/presentation/components/btn_black_icon.dart';
import 'package:g4c/presentation/components/btn_navigation.dart';

class G4CDrawer extends StatelessWidget {
  const G4CDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 195, 255, 195),
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
                    onPressed: () {
                      navtoPersQuiz(context);
                    },
                    iconData: Icons.search),
                BtnNavigation(
                    btnText: "Progress Tracker",
                    onPressed: () {
                      navtoProgressTracker(context);
                    },
                    iconData: Icons.trending_up),
                BtnNavigation(
                    btnText: "Job Roles",
                    onPressed: () {
                      navtoJobRoles(context);
                    },
                    iconData: Icons.castle),
                BtnNavigation(
                    btnText: "Profile",
                    onPressed: () {
                      navtoProfilePage(context);
                    },
                    iconData: Icons.supervised_user_circle),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: BtnBlackIcon(
                    onpressed: () {
                      logout(context);
                    },
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

AppBar G4CAppBar(String pageTitle, bool rounded) {
  return AppBar(
    shape: rounded
        ? const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          )
        : null,
    title: Text(
      pageTitle,
      style: const TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: const Color.fromARGB(255, 195, 255, 195),
    centerTitle: false,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Image.asset(
          'asset_lib/images/G4C_logo_text.png',
          width: 50.0,
        ),
      ),
    ],
  );
}
