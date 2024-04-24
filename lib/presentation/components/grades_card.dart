import 'package:flutter/material.dart';
import 'package:g4c/data/entities/semester_item.dart';
import 'package:g4c/data/entities/subject.dart';

class GradesCard extends StatelessWidget {
  const GradesCard({
    super.key,
    required this.semesterItems,
    this.expansionCallback,
  });

  final List<SemesterItem> semesterItems;
  final Function(int, bool)? expansionCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ExpansionPanelList(
            expansionCallback: expansionCallback,
            children: semesterItems
                .map((semesterItem) => ExpansionPanel(
                      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                      isExpanded: semesterItem.isExpanded,
                      headerBuilder: (context, isExpanded) => ListTile(
                        title: Text("SEMESTER ${semesterItem.semesterNumber}"),
                      ),
                      body: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Column(
                          children: semesterItem.subjectList
                              .map((subject) => GradeEntry(
                                    subject: subject,
                                    initialSelection: subject.gradeValue,
                                  ))
                              .toList(),
                        ),
                      ),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}

class GradeEntry extends StatelessWidget {
  const GradeEntry({
    super.key,
    required this.subject,
    required this.initialSelection,
  });

  final Subject subject;
  final double initialSelection;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          subject.subjectName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(subject.subjectCode),
            DropdownMenu(
                onSelected: (value) {
                  subject.gradeValue = value ?? 0.0;
                  print("changed subject value to ${subject.gradeValue}");
                },
                initialSelection: initialSelection,
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 0.0, label: "N/A"),
                  DropdownMenuEntry(value: 4.0, label: "A+"),
                  DropdownMenuEntry(value: 4.0, label: "A"),
                  DropdownMenuEntry(value: 3.7, label: "A-"),
                  DropdownMenuEntry(value: 3.3, label: "B+"),
                  DropdownMenuEntry(value: 3.0, label: "B"),
                  DropdownMenuEntry(value: 2.7, label: "B-"),
                  DropdownMenuEntry(value: 2.3, label: "C+"),
                  DropdownMenuEntry(value: 2.0, label: "C"),
                  DropdownMenuEntry(value: 1.7, label: "C-"),
                  DropdownMenuEntry(value: 1.3, label: "D+"),
                  DropdownMenuEntry(value: 1.0, label: "D"),
                  DropdownMenuEntry(value: 0.0, label: "E"),
                  DropdownMenuEntry(value: 0.0, label: "MC"),
                ])
          ],
        )
      ],
    );
  }
}
