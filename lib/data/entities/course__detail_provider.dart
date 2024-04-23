import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CourseDetailProvider extends ChangeNotifier {
  String _degreeCode = 'n/a';
  double _degreeGpa = 0.0;
  double _degreeProgress = 0.0;
  List<List<double>>? _degreeGradeValues;

  String get degreeCode => _degreeCode;

  double get degreeGpa => _degreeGpa;

  double get degreeProgress => _degreeProgress;

  List<List<double>>? get degreeGradeValues => _degreeGradeValues;

  void setDegreeCode(String degreeCode) {
    _degreeCode = degreeCode;
    notifyListeners();
  }

  void setDegreeGpa(double degreeGpa) {
    _degreeGpa = degreeGpa;
    notifyListeners();
  }

  void setDegreeProgress(double degreeProgress) {
    _degreeProgress = degreeProgress;
    notifyListeners();
  }

  void setGradeValues(List<List<double>> degreeGradeValues) {
    _degreeGradeValues = degreeGradeValues;
    notifyListeners();
  }

  void resetGradeValues() {
    _degreeGradeValues?.clear();
    notifyListeners();
  }

  Future<void> refreshDegreeData(String? uid) async {
    if (uid != null) {
      Map<String, dynamic> userDoc = {};
      CollectionReference userDB =
          FirebaseFirestore.instance.collection('Users');
      await userDB.doc(uid).get().then((value) {
        userDoc = value.data() as Map<String, dynamic>;
      });
      print(userDoc['uid']);
      print("Setting code as ${userDoc['degreeProgram']}");
      setDegreeCode(userDoc['degreeProgram']);
      print("Set courseProvider code as $_degreeCode");
    } else {
      throw Exception('User not found');
    }
  }
}
