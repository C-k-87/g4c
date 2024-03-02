import 'package:flutter/material.dart';
import 'package:g4c/domain/use_cases/firestore_sp.dart';
import 'package:g4c/presentation/views/loading_page.dart';
import 'package:firebase_core/firebase_core.dart';
import '../data/data_sources/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  bool isSignedIn = await isLogged();
  runApp(G4CApp(
    isSignedIn: isSignedIn,
  ));
}

class G4CApp extends StatelessWidget {
  final bool isSignedIn;

  const G4CApp({super.key, required this.isSignedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'G4C - Guidance for Career',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade200),
        useMaterial3: true,
      ),
      home: LoadingPage(
        isSignedIn: isSignedIn,
      ),
    );
  }
}
