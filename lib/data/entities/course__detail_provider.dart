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
}
