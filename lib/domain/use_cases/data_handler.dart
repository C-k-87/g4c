import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:g4c/data/entities/quiz_scores.dart';
import 'package:path_provider/path_provider.dart';
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
    };
    db.collection('Users').doc(user.uid).set(userInfo);
    setPrefs(user);
  }

  Future<void> setUserProfile(String uid) async {
    QuizScores scores = QuizScores(0, 0, 0, 0, 0, 0);
    await userDB.doc(uid).get().then((doc) {
      var data = doc.data() as Map<String, dynamic>;
      scores = QuizScores(
        data['ascore'],
        data['cscore'],
        data['escore'],
        data['iscore'],
        data['rscore'],
        data['sscore'],
      );
    });
    await setQuizPrefs(scores);
  }

  Future<void> setPrefs(User user) async {
    String name = user.displayName ?? "";
    String uid = user.uid;
    String email = user.email ?? "";
    String imgURL = user.photoURL ?? "";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('uid', uid);
    await prefs.setString('email', email);
    await prefs.setString('imageURL', imgURL);
  }

  Future<void> updateQuizResults(QuizScores quizScores) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await userDB
        .doc(prefs.getString('uid'))
        .set(quizScores.getMap(), SetOptions(merge: true));
    setQuizPrefs(quizScores);
  }

  Future<void> setQuizPrefs(QuizScores quizScores) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('ascore', quizScores.artistic);
    await prefs.setInt('cscore', quizScores.conventional);
    await prefs.setInt('escore', quizScores.enterprising);
    await prefs.setInt('iscore', quizScores.investigative);
    await prefs.setInt('rscore', quizScores.realistic);
    await prefs.setInt('sscore', quizScores.social);
  }

  Future<dynamic> initializeProfilePage(
      String? username, String? userImage, QuizScores quizScores) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await setUserProfile(prefs.getString('uid')!);
    username = prefs.getString('name');
    userImage = prefs.getString('imageURL');
    quizScores.setScore('a', prefs.getInt('ascore') ?? 0);
    quizScores.setScore('c', prefs.getInt('cscore') ?? 0);
    quizScores.setScore('e', prefs.getInt('escore') ?? 0);
    quizScores.setScore('i', prefs.getInt('iscore') ?? 0);
    quizScores.setScore('r', prefs.getInt('rscore') ?? 0);
    quizScores.setScore('s', prefs.getInt('sscore') ?? 0);
    return await DataHandler().getRolesList();
  }
}
