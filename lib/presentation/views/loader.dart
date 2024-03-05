import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitThreeBounce(
          duration: Duration(seconds: 2),
          size: 30,
          color: Colors.black,
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "G4C has encountered an error...",
            ),
          ),
          SpinKitCircle(
            duration: Duration(seconds: 2),
            size: 30,
            color: Colors.black,
          )
        ],
      )),
    );
  }
}
