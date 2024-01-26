import 'package:flutter/material.dart';
// ignore: unused_import
import 'asset_widgets.dart';
import 'package:g4c/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'G4C - Guidance for Career',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade200),
        useMaterial3: true,
      ),
      home: const G4CRunner(),
    );
  }
}

class G4CRunner extends StatelessWidget {
  const G4CRunner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfilePage(),
    );
  }
}
