import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g4c/data/entities/data_provider.dart';
import 'package:g4c/data/entities/quiz_scores.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataHandler {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  late CollectionReference userDB;

  DataHandler() {
    userDB = db.collection('Users');
  }

  void writeToUserFile(
      Map<String, Map<String, dynamic>> data, String filePath) {
    String jsonData = jsonEncode(data);
    File(filePath).writeAsStringSync(jsonData);
  }

  Future<dynamic> getRolesList() async {
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      String filePath = '${dir.path}/job_roles.json';
      String jsonData = await File(filePath).readAsString();
      Map<String, dynamic> data = jsonDecode(jsonData);
      return data["roles"];
    } catch (e) {
      final String resp = await rootBundle
          .loadString('lib/data/data_sources/json/job_roles.json');
      final data = await jsonDecode(resp);
      return data["roles"];
    }
  }

  Future<dynamic> getDegreeProgram(String degreeName) async {
    final String resp = await rootBundle
        .loadString('lib/data/data_sources/json/$degreeName.json');
    final data = await jsonDecode(resp);
    return data;
  }

  Future<bool> isLogged() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isSignedIn') ?? false;
  }

  Future<bool> isRegistered(String uid) async {
    bool registered = false;
    await userDB.doc(uid).get().then((value) {
      registered = value.exists;
    });
    return registered;
  }

  Future<void> initializeUserProfile(User user) async {
    Map<String, dynamic> userInfo = {
      "uid": user.uid,
      "name": user.displayName,
      "email": user.email,
      "imageURL": user.photoURL,
      "ascore": 0,
      "cscore": 0,
      "escore": 0,
      "iscore": 0,
      "rscore": 0,
      "sscore": 0,
    };
    userDB.doc(user.uid).set(userInfo);
    setPrefs(user);
  }

  Future<void> setPrefs(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', user.uid);
    print("Set the user ID as ${prefs.getString('uid')}");
  }

  Future<void> updateQuizResults(
      QuizScores quizScores, BuildContext context) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    DataProvider provider = Provider.of<DataProvider>(context, listen: false);
    print("updating quiz results on user ${provider.userID}");
    provider.quizScores = quizScores;
    await userDB
        .doc(provider.userID)
        .set(quizScores.getMap(), SetOptions(merge: true));
  }
}
