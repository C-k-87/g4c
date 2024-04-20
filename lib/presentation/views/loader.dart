import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Center(
          child: SpinKitThreeBounce(
            duration: Duration(seconds: 2),
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.error});
  final Object? error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              error != null
                  ? error.toString()
                  : "G4C has encountered an error...",
            ),
          ),
          const SpinKitCircle(
            duration: Duration(seconds: 2),
            size: 30,
            color: Colors.black,
          )
        ],
      )),
    );
  }
}
