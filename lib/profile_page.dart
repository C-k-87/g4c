import 'package:flutter/material.dart';
import 'package:g4c/asset_widgets.dart';
import 'package:g4c/g4c_drawer.dart';

class ProfilePage extends StatelessWidget {
  final double fontsize = 15.0;

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20.0),
        // ),
        title: const Text(
          'Page Title',
          style: TextStyle(
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
      ),
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
                  const Positioned(
                    top: 50.0,
                    child: Text(
                      'User Name',
                      style: TextStyle(
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
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Icon(
                        Icons.supervised_user_circle,
                        color: Colors.blue[100],
                        size: 200.0,
                      ), // TODO: implement Profile Picture
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
}
