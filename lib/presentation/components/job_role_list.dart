import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g4c/domain/use_cases/create_roles_list.dart';
import 'package:g4c/presentation/components/job_role_entry.dart';

class JobRoleList extends StatefulWidget {
  final String searchParam;

  const JobRoleList({super.key, required this.searchParam});

  @override
  State<JobRoleList> createState() => _JobRoleListState();
}

class _JobRoleListState extends State<JobRoleList> {
  List<JobRoleEntry> rolesList = [];

  Future<void> readFile() async {
    final String resp = await rootBundle
        .loadString('lib/data/data_sources/json/job_roles.json');
    final data = await jsonDecode(resp);

    setState(() {
      final allRoles = data["roles"];
      for (var role in allRoles) {
        rolesList.add(
          JobRoleEntry(
            role: role,
          ),
        );
      }
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
