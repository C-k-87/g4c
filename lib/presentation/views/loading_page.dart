import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:g4c/domain/use_cases/routing.dart';

class LoadingPage extends StatelessWidget {
  final bool isSignedIn;

  const LoadingPage({super.key, required this.isSignedIn});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      isSignedIn ? navtoProfilePage(context) : navtoLogin(context);
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 255, 195),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset_lib/images/G4C_logo_transparent.png',
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 20),
            const Text(
              'DISCOVER YOURSELF',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 20),
            const SpinKitThreeBounce(
              duration: Duration(seconds: 2),
              size: 30,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
