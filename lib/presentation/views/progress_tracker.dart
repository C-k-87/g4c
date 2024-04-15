import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';
import 'package:g4c/presentation/components/text_fields.dart';

import '../components/progress_card.dart';

void main() {
  runApp(const MaterialApp(
    home: ProgressTracker(),
  ));
}

class ProgressTracker extends StatelessWidget {
  const ProgressTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: G4CAppBar("Progress Tracker", true),
      drawer: const G4CDrawer(),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: [
          heading("Degree Program"),
          const ProgressCard(gpa: 2.5, progress: 20,),
          const SizedBox(height: 20.0,),
          heading("Extra Courses"),
          const ProgressCard(gpa: 1.0, progress: 50,),
          const SizedBox(height: 20.0,),
          heading("Extra Activities"),
        ],
      ),
    );
  }
}
