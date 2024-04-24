import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:g4c/data/entities/quiz_scores.dart';
import 'package:g4c/presentation/components/prof_pic.dart';

class DataProvider extends ChangeNotifier {
  String _userID = 'n/a';
  String _userEmail = 'n/a';
  String _userName = 'Username';
  ProfPic _userProfPic = const ProfPic();
  QuizScores _userScores = QuizScores(0, 0, 0, 0, 0, 0);

  String get userID => _userID;
  String get userEmail => _userEmail;
  String get userName => _userName;
  ProfPic get userProfPic => _userProfPic;
  QuizScores get userScores => _userScores;

  set quizScores(QuizScores quizScores) {
    _userScores = quizScores;
    notifyListeners();
  }

  set userProfPic(ProfPic profPic) {
    _userProfPic = profPic;
    notifyListeners();
  }

  Future<void> refreshUserData(String? uid) async {
    if (uid != null) {
      print("refreshing data for $uid");
      Map<String, dynamic> userDoc = {};
      CollectionReference userDB =
          FirebaseFirestore.instance.collection('Users');
      await userDB.doc(uid).get().then((value) {
        userDoc = value.data() as Map<String, dynamic>;
      });

      _userID = userDoc['uid'];
      _userEmail = userDoc['email'];
      _userName = userDoc['name'];
      userProfPic = ProfPic(url: userDoc['imageURL']);
      quizScores = QuizScores(
        userDoc['ascore'],
        userDoc['cscore'],
        userDoc['escore'],
        userDoc['iscore'],
        userDoc['rscore'],
        userDoc['sscore'],
      );
    } else {
      throw Exception('User not found');
    }
  }
}
