import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/course_card.dart';

class ExtraCourse extends StatefulWidget {
  const ExtraCourse({Key? key}) : super(key: key);

  @override
  _ExtraCourseState createState() => _ExtraCourseState();
}

class _ExtraCourseState extends State<ExtraCourse> {
  final col1 = const Color.fromARGB(255, 195, 255, 195);

  List<String> courses = [];
  final TextEditingController courseController = TextEditingController();
  String? editingCourse;
  int? editingIndex;

  void addCourse() {
    setState(() {
      String newCourse = courseController.text;
      if (newCourse.isNotEmpty) {
        courses.add(newCourse);
        courseController.clear();
      }
    });
  }

  void deleteCourse(int index) {
    setState(() {
      courses.removeAt(index);
    });
  }

  void editCourse(int index) {
    setState(() {
      editingIndex = index;
      editingCourse = courses[index];
      courseController.text = editingCourse!;
    });
  }

  void saveEditedCourse() {
    setState(() {
      courses[editingIndex!] = courseController.text;
      editingCourse = null;
      editingIndex = null;
      courseController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: col1,
        toolbarHeight: 35.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 70.0),
            const Text(
              'ENTER',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'YOUR EXTRA COURSES',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            const SizedBox(height: 50.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: courseController,
                    decoration: const InputDecoration(
                      labelText: 'Course Name',
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed:
                      editingCourse != null ? saveEditedCourse : addCourse,
                  child: Text(editingCourse != null ? 'Save' : 'Add'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return CourseCard(
                    courseName: courses[index],
                    onDelete: () => deleteCourse(index),
                    onEdit: () => editCourse(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
