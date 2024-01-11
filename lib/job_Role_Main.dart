import 'package:flutter/material.dart';
import 'asset_widgets.dart';

class JobRoleMain extends StatelessWidget {
  const JobRoleMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 254, 253), // Use 'color' instead of 'backgroundColor'
      body: ListView(
        children: [
          const TopCard(
            content: Image(
              fit: BoxFit.fill,
              image: AssetImage('asset_lib/images/JobRolesBackdrop.png'),
            ),
            color: Color.fromARGB(255, 195, 255, 195),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "FIND YOUR",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 38,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "CALLING",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 55,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              TxtSearch(
                fieldName: 'Search your role',
                onChanged: (text) {
                  print(text);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
