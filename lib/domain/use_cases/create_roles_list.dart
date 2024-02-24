import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/job_role_entry.dart';

List<Widget> createRolesList(List<JobRoleEntry> roles, String searchParam) {
  List<Widget> rolesList = [];

  if (searchParam.isEmpty) {
    for (var role in roles) {
      rolesList.add(
        JobRoleEntry(role: role.role),
      );
    }
  } else {
    for (var role in roles) {
      if (role.role.name.toLowerCase().contains(searchParam.toLowerCase())) {
        rolesList.add(
          JobRoleEntry(role: role.role),
        );
      }
    }
  }
  return rolesList;
}
