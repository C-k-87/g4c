import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';

class ProgressTracker extends StatelessWidget {
  const ProgressTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: G4CAppBar("Progress Tracker", true),
      drawer: const G4CDrawer(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.android_outlined),
            Text('To be implemented'),
          ],
        ),
      ),
    );
  }
}
