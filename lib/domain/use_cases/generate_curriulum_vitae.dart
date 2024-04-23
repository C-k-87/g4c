import 'dart:io';

import 'package:flutter/material.dart';
import 'package:g4c/data/entities/course__detail_provider.dart';
import 'package:g4c/data/entities/data_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void generateCurriculumVitae(String uid, BuildContext context) async {
  final cv = pw.Document();
  final DataProvider provider =
      Provider.of<DataProvider>(context, listen: false);
  final CourseDetailProvider courseProvider =
      Provider.of<CourseDetailProvider>(context, listen: false);
  cv.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
            child: pw.Column(children: [
          pw.SizedBox(width: 30.0),
          pw.Text(provider.userName),
          pw.Text(provider.userEmail),
          pw.Text(provider.userScores.getType()),
          pw.Text(courseProvider.degreeCode),
          pw.Text(courseProvider.degreeGpa.toString()),
          pw.Text(courseProvider.degreeProgress.toString()),
        ]));
      }));

  try {
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/cv.pdf");
    await file.writeAsBytes(await cv.save());
  } on Exception catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Error : ${e.toString()}")));
  }
}
