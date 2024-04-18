import 'package:flutter/material.dart';

Widget heading(String text, {double padding = 8.0}) {
  return Padding(
    padding:  EdgeInsets.all(padding),
    child: Text(
      text,
      style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
  );
}

Widget subheading(String text, {double hrPadding = 15.0}) {
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: hrPadding),
    child: Text(
      text,
      style: const TextStyle(fontSize: 15.0),
    ),
  );
}

Widget body(text) {
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

Widget courseCard(text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Text(text),
  );
}
