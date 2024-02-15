import 'package:g4c/domain/repositories/enumerations.dart';

class PrefRecord {
  final int length;
  late List<Preference> prefList;

  PrefRecord(this.length) {
    List<Preference> prefList =
        List.generate(length, (index) => Preference.neutral);
  }

  void updateRec(int index, Preference newPref) {
    prefList[index] = newPref;
  }

  Preference getRec(int index) {
    return prefList[index];
  }
}
