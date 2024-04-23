import 'package:flutter/material.dart';
import 'package:g4c/data/entities/course__detail_provider.dart';
import 'package:g4c/data/entities/data_provider.dart';
import 'package:provider/provider.dart';

void generateCurriculumVitae(String uid, BuildContext context) {
  DataProvider provider = Provider.of<DataProvider>(context);
  CourseDetailProvider courseProvider =
      Provider.of<CourseDetailProvider>(context);
}
