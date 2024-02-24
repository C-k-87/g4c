import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g4c/domain/use_cases/create_roles_list.dart';

class JobRoleList extends StatefulWidget {
  final String searchParam;

  const JobRoleList({super.key, required this.searchParam});

  @override
  State<JobRoleList> createState() => _JobRoleListState();
}

class _JobRoleListState extends State<JobRoleList> {
  List rolesList = [];

  Future<void> readFile() async {
    final String resp = await rootBundle
        .loadString('lib/data/data_sources/json/job_roles.json');
    final data = await jsonDecode(resp);

    rolesList = data["roles"];
  }

  @override
  Widget build(BuildContext context) {
    String searchParam = widget.searchParam;

    return FutureBuilder(
        future: readFile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text("error");
          } else {
            List<Widget> children = createRolesList(rolesList, searchParam);
            return Column(
              children: children,
            );
          }
        });
  }
}
