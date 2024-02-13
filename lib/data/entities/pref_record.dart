import 'package:g4c/domain/repositories/enumerations.dart';

class PrefRecord {
  PrefRecord();

  List<Preference> prefList = List.generate(50, (index) => Preference.neutral);

  void updateRec(int index, Preference newPref) {
    prefList[index] = newPref;
  }

  Preference getRec(int index) {
    return prefList[index];
  }
}
