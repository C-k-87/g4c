import 'package:flutter/material.dart';

showAlert(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"))
        ],
        content: Text(message),
      );
    },
  );
}
