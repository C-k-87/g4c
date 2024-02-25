import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/job_role_entry.dart';

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

List<Widget> createRecommendedRoles(List roles, String type) {
  String typeChar = 'N';

  switch (type) {
    case 'artistic':
      typeChar = 'A';
      break;
    case 'conventional':
      typeChar = 'C';
      break;
    case 'enterprising':
      typeChar = 'E';
      break;
    case 'investigative':
      typeChar = 'I';
      break;
    case 'realistic':
      typeChar = 'R';
      break;
    case 'social':
      typeChar = 'S';
      break;
    default:
  }
  List<Widget> rolesList = [];
  for (var role in roles) {
    if (role["traits"][0] == typeChar) {
      rolesList.add(
        JobRoleEntry(role: role),
      );
    } else if (rolesList.length < 5 && role["traits"][1] == typeChar) {
      rolesList.add(
        JobRoleEntry(role: role),
      );
    }
  }
  return rolesList;
}
