import 'package:flutter/material.dart';
import 'package:g4c/asset_widgets.dart';
import 'package:g4c/job_role_main.dart';
import 'package:g4c/login.dart';
import 'package:g4c/personality_quizes_main.dart';
import 'package:g4c/profile_page.dart';

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PersonalityMain()),
                      );
                    },
                    iconData: Icons.search),
                BtnNavigation(
                    btnText: "Progress Tracker",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()),
                      );
                    },
                    iconData: Icons.trending_up),
                BtnNavigation(
                    btnText: "Job Roles",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const JobRoleMain()),
                      );
                    },
                    iconData: Icons.castle),
                BtnNavigation(
                    btnText: "Profile",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()),
                      );
                    },
                    iconData: Icons.supervised_user_circle),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: BtnBlackIcon(
                    onpressed: () {
                      //TODO : Implement sessions logout
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
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
