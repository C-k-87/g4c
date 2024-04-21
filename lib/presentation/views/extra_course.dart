import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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


  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  @override
  void initState() {
    super.initState();
    // Fetch existing courses from Firestore on initialization
    _fetchCourses();
  }


  Future<void> _fetchCourses() async {
    try {
      final snapshot = await _firestore.collection('courses').get();
      setState(() {
        courses = snapshot.docs.map((doc) => doc['courseName'] as String).toList();
      });
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }


  Future<void> addCourse() async {
    final newCourse = courseController.text;
    if (newCourse.isNotEmpty) {
      try {
        await _firestore.collection('courses').add({'courseName': newCourse});
        setState(() {
          courses.add(newCourse);
          courseController.clear();
        });
      } catch (e) {
        print('Error adding course to Firestore: $e');
      }
    }
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


  Future<void> saveEditedCourse() async {
    try {
      await _firestore.collection('courses').doc(editingIndex.toString()).update({'courseName': courseController.text});
      setState(() {
        courses[editingIndex!] = courseController.text;
        editingCourse = null;
        editingIndex = null;
        courseController.clear();
      });
    } catch (e) {
      print('Error saving edited course: $e');
    }
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
                  onPressed: editingCourse != null ? saveEditedCourse : addCourse,
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
