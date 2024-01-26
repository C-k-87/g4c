import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'asset_widgets.dart';

class JobRoleMain extends StatelessWidget {
  const JobRoleMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 253, 254, 253), // Use 'color' instead of 'backgroundColor'
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
              const SizedBox(height: 30.0),
              const JobRoleList(),
              const SizedBox(height: 20.0),
            ],
          ),
        ],
      ),
    );
  }
}

class JobRoleList extends StatefulWidget {
  const JobRoleList({super.key});

  @override
  State<JobRoleList> createState() => _JobRoleListState();
}

class _JobRoleListState extends State<JobRoleList> {
  List rolesList = [];

  Future<void> readFile() async {
    final String resp =
        await rootBundle.loadString('asset_lib/json/sample.json');
    final data = await jsonDecode(resp);

    setState(() {
      rolesList = data["roles"];
    });
  }

  @override
  Widget build(BuildContext context) {
    readFile();
    return Column(
      children: createRolesList(rolesList),
    );
  }
}

List<Widget> createRolesList(List roles) {
  List<Widget> rolesList = [];
  for (var role in roles) {
    rolesList.add(
      InkWell(
        onTap: () {
          print(role["image"]);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 10.0,
                  offset: Offset.zero,
                )
              ]),
          child: Row(
            children: [
              Image(
                image:
                    AssetImage('asset_lib/images/roleimages/${role["image"]}'),
              ),
              Expanded(
                child: Text(
                  role["name"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  return rolesList;
}
