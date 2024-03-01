import 'package:flutter/material.dart';
import 'package:g4c/presentation/views/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:g4c/presentation/views/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/data_sources/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  debugProfileBuildsEnabled = true;
  bool isSignedIn = await isLogged();
  runApp(G4CApp(
    isSignedIn: isSignedIn,
  ));
}

Future<bool> isLogged() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isSignedIn') ?? false;
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
      home: isSignedIn ? const ProfilePage() : const LoginPage(),
    );
  }
}
