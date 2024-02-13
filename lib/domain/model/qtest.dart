import 'package:flutter/material.dart';
import 'package:g4c/domain/repositories/enumerations.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  PrefRecord set1 = PrefRecord();

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var children2 = [
      Row(
        children: [
          Radio(
              value: Preference.agree,
              groupValue: widget.set1.getRec(0),
              onChanged: (value) {
                setState(() {
                  widget.set1.updateRec(0, value!);
                });
              }),
          Radio(
              value: Preference.disagree,
              groupValue: widget.set1.getRec(0),
              onChanged: (value) {
                setState(() {
                  widget.set1.updateRec(0, value!);
                });
              }),
        ],
      ),
      const SizedBox(
        height: 10.0,
      ),
      Row(
        children: [
          Radio(
              value: Preference.agree,
              groupValue: widget.set1.getRec(1),
              onChanged: (value) {
                setState(() {
                  widget.set1.updateRec(1, value!);
                });
              }),
          Radio(
              value: Preference.disagree,
              groupValue: widget.set1.getRec(1),
              onChanged: (value) {
                setState(() {
                  widget.set1.updateRec(1, value!);
                });
              }),
        ],
      ),
      const SizedBox(
        height: 10.0,
      ),
      Row(
        children: [
          Radio(
              value: Preference.agree,
              groupValue: widget.set1.getRec(2),
              onChanged: (value) {
                setState(() {
                  widget.set1.updateRec(2, value!);
                });
              }),
          Radio(
              value: Preference.disagree,
              groupValue: widget.set1.getRec(2),
              onChanged: (value) {
                setState(() {
                  widget.set1.updateRec(2, value!);
                });
              }),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.set1 = PrefRecord();
                });
              },
              child: const Text("Set")),
        ],
      ),
    ];
    return Scaffold(
      body: Column(
        children: children2,
      ),
    );
  }
}

class PrefRecord {
  PrefRecord();

  void updateRec(int index, Preference newPref) {
    prefList[index] = newPref;
  }

  Preference getRec(int index) {
    return prefList[index];
  }

  List<Preference> prefList = List.generate(10, (index) => Preference.disagree);
}
