import 'package:flutter/material.dart';
import 'package:g4c/job_role_main.dart';
// ignore: unused_import
import 'asset_widgets.dart';
import 'g4c_drawer.dart';

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
      home: const JobRoleMain(),
    );
  }
}

class HomePageTest extends StatelessWidget {
  const HomePageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: const Text(
          'Page Title',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 195, 255, 195),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Image.asset(
              'asset_lib/images/G4C_logo_text.png',
              width: 50.0,
            ),
          ),
        ],
      ),
      body: null,
      drawer: G4CDrawer(),
    );
  }
}
