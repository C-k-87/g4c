import 'package:flutter/material.dart';
import 'package:g4c/data/entities/data_provider.dart';
import 'package:g4c/domain/use_cases/data_handler.dart';
import 'package:g4c/presentation/views/loading_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '../data/data_sources/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => DataProvider(),
    child: G4CApp(
      isSignedIn: await DataHandler().isLogged(),
    ),
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
