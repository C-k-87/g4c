import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class DataHandler {
  Directory? dir;
  var db = FirebaseFirestore.instance;

  void writeToUserFile(
      Map<String, Map<String, dynamic>> data, String filePath) {
    String jsonData = jsonEncode(data);
    File(filePath).writeAsStringSync(jsonData);
  }

  Future<dynamic> getRolesList() async {
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      String filePath = '${dir.path}/job_roles.json';
      String jsonData = File(filePath).readAsStringSync();
      Map<String, dynamic> data = jsonDecode(jsonData);
      return data["roles"];
    } catch (e) {
      final String resp = await rootBundle
          .loadString('lib/data/data_sources/json/job_roles.json');
      final data = await jsonDecode(resp);
      return data["roles"];
    }
  }
}
