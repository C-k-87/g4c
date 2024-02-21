import 'package:flutter/material.dart';
import 'package:g4c/domain/use_cases/personality_quiz_runner.dart';
import 'package:g4c/presentation/views/login.dart';]
import 'package:firebase_core/firebase_core.dart';
import '../data/data_sources/firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      body: PersonalityQuizRunner(),
    );
  }
  
}
