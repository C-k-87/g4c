import 'package:flutter/material.dart';

heading(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
  );
}

subheading(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Text(
      text,
      style: const TextStyle(fontSize: 15.0),
    ),
  );
}

body(text) {
  String data = '';
  try {
    data = text;
  } catch (e) {
    data = 'Steps: \n';
    for (var step in text["steps"]) {
      data += "\t $step \n";
    }
  }
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Text(
      data,
      textAlign: TextAlign.justify,
    ),
  );
}

courseCard(text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Text(text),
  );
}
