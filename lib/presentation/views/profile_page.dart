import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/card_widget.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';
import 'package:g4c/presentation/components/prof_pic.dart';
import 'package:g4c/presentation/components/top_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ProfilePage());
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double fontsize = 15.0;
  String? username;
  String? userImage;
  // = const Image(image: AssetImage('asset_lib/images/glogo.png'));

  @override
  void initState() {
    super.initState();
    getUserVars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: G4CAppBar('Profile Page', false),
      drawer: const G4CDrawer(),
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    height: 220.0,
                    child: TopCard(
                      content: //Image(
                          //fit: BoxFit.fill,
                          //image: AssetImage('asset_lib/images/back.png'),
                          //),
                          Container(
                        color: const Color.fromARGB(255, 195, 255, 195),
                      ),
                      color: const Color.fromARGB(255, 195, 255, 195),
                    ),
                  ),
                  Positioned(
                    top: 50.0,
                    child: Text(
                      username ?? " ", // USERNAME
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120.0,
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ProfPic(url: userImage), // PROFILE PICTURE
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 120.0),
              CardWidget(
                content: Container(
                  height: 100.0,
                ),
                title: 'Personality Type',
                fontsize: fontsize,
              ),
              CardWidget(
                content: Container(
                  height: 100.0,
                ),
                title: 'Traits',
                fontsize: fontsize,
              ),
              CardWidget(
                content: Container(
                  height: 100.0,
                ),
                title: 'Skill Level',
                fontsize: fontsize,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> getUserVars() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('name'));
    print(prefs.getString('imageURL'));

    setState(() {
      username = prefs.getString('name')!;
      userImage = prefs.getString('imageURL');
    });
  }
}
