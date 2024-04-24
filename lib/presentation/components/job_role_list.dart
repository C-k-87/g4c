import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:g4c/domain/use_cases/create_roles_list.dart';
import 'package:g4c/domain/use_cases/data_handler.dart';

class JobRoleList extends StatefulWidget {
  final String searchParam;

  const JobRoleList({super.key, required this.searchParam});

  @override
  State<JobRoleList> createState() => _JobRoleListState();
}

class _JobRoleListState extends State<JobRoleList> {
  List rolesList = [];

  Future<dynamic> readFile() async {
    final String resp = await rootBundle
        .loadString('lib/data/data_sources/json/job_roles.json');
    final data = await jsonDecode(resp);

    return data["roles"];
  }

  @override
  Widget build(BuildContext context) {
    String searchParam = widget.searchParam;

    return FutureBuilder(
        future: DataHandler().getRolesList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("Loading");
            return const SpinKitCircle(
              color: Colors.black,
            );
          } else if (snapshot.hasError) {
            return SpinKitThreeBounce();
          } else {
            rolesList = snapshot.data;
            List<Widget> children = createRolesList(rolesList, searchParam);
            return Column(
              children: children,
            );
          }
        });
  }
}
