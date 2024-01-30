import 'package:flutter/material.dart';
// ignore: unused_import
import 'asset_widgets.dart';
import 'package:g4c/profile_page.dart';
import 'package:g4c/job_role_main.dart';
import 'package:g4c/login.dart';
import 'g4c_drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
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
