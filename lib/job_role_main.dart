import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:g4c/g4c_drawer.dart';
import 'package:flutter/services.dart';=
import 'asset_widgets.dart';

class JobRoleMain extends StatefulWidget {
  const JobRoleMain({super.key});

  @override
  State<JobRoleMain> createState() => _JobRoleMainState();
}

class _JobRoleMainState extends State<JobRoleMain> {
  String _searchParam = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 254, 253),
      appBar: G4CAppBar('Job Roles', false),
      drawer: const G4CDrawer(), // Use 'color' instead of 'backgroundColor
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
                  setState(() {
                    _searchParam = text;
                  });
                },
              ),
              const SizedBox(height: 30.0),
              JobRoleList(searchParam: _searchParam),
              const SizedBox(height: 20.0),
            ],
          ),
        ],
      ),
    );
  }
}

class JobRoleList extends StatefulWidget {
  final String searchParam;
  const JobRoleList({super.key, required this.searchParam});

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
    String searchParam = widget.searchParam;

    readFile();
    return Column(
      children: createRolesList(
        rolesList,
        searchParam,
      ),
    );
  }
}

List<Widget> createRolesList(List roles, String searchParam) {
  List<Widget> rolesList = [];

  if (searchParam.isEmpty) {
    for (var role in roles) {
      rolesList.add(
        JobRoleEntry(role: role),
      );
    }
  } else {
    for (var role in roles) {
      if (role["name"].toLowerCase().contains(searchParam.toLowerCase())) {
        rolesList.add(
          JobRoleEntry(role: role),
        );
      }
    }
  }
  return rolesList;
}
