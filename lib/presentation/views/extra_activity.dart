import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/course_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExtraActivity extends StatefulWidget {
  const ExtraActivity({Key? key}) : super(key: key);

  @override
  _ExtraActivityState createState() => _ExtraActivityState();
}

class _ExtraActivityState extends State<ExtraActivity> {
  final col1 = const Color.fromARGB(255, 195, 255, 195);

  List<String> activities = [];
  List<Map<String, dynamic>> activitiesData = [];

  final TextEditingController activityController = TextEditingController();
  String? editingActivity;
  int? editingIndex;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
@override
  void initState() {
    super.initState();
    // Fetch existing activities from Firestore on initialization
    _fetchActivities();
  }

  Future<void> _fetchActivities() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        final snapshot = await _firestore
            .collection('user')
            .doc(user.uid)
            .collection('activities')
            .get();
        setState(() {
          activitiesData = snapshot.docs
              .map((doc) => {'id': doc.id, 'activityName': doc['activityName']})
              .toList();
          activities =
              activitiesData.map((data) => data['activityName'] as String).toList();
        });
      } catch (e) {
        print('Error fetching activities: $e');
      }
    } else {
      print('No user is currently signed in.');
    }
  }

  Future<void> addActivity() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final newActivity = activityController.text;
      if (newActivity.isNotEmpty) {
        try {
          await _firestore
              .collection('user')
              .doc(user.uid)
              .collection('activities')
              .add({'activityName': newActivity});
          setState(() {
            activities.add(newActivity);
            activityController.clear();
          });
        } catch (e) {
          print('Error adding activity to Firestore: $e');
        }
      }
    } else {
      print('No user is currently signed in.');
    }
  }

  void deleteActivity(int index) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final activityNameToDelete = activities[index];
      setState(() {
        activities.removeAt(index);
      });

      try {
        await _firestore
            .collection('user')
            .doc(user.uid)
            .collection('activities')
            .where('activityName', isEqualTo: activityNameToDelete)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((doc) async {
            await doc.reference.delete();
          });
        });
      } catch (e) {
        print('Error deleting activity from Firestore: $e');
      }
    } else {
      print('No user is currently signed in.');
    }
  }

  void editActivity(int index) {
    setState(() {
      editingIndex = index;
      editingActivity = activities[index];
      activityController.text = editingActivity!;
    });
  }

  Future<void> saveEditedActivity() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null &&
        editingIndex != null &&
        editingIndex! < activitiesData.length) {
      try {
        final activityId = activitiesData[editingIndex!]['id'];
        await _firestore
            .collection('user')
            .doc(user.uid)
            .collection('activities')
            .doc(activityId)
            .update({'courseName': activityController.text});
        setState(() {
          activities[editingIndex!] = activityController.text;
          editingActivity = null;
          editingIndex = null;
          activityController.clear();
        });
      } catch (e) {
        print('Error saving edited activity: $e');
      }
    } else {
      print('Editing index is null or out of range, or user is not signed in.');
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
              'YOUR EXTRA ACTIVITIES',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            const SizedBox(height: 50.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: activityController,
                    decoration: const InputDecoration(
                      labelText: 'Activity Name',
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed:
                      editingActivity != null ? saveEditedActivity : addActivity,
                  child: Text(editingActivity != null ? 'Save' : 'Add'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return CourseCard(
                    courseName: activities[index],
                    onDelete: () => deleteActivity(index),
                    onEdit: () => editActivity(index),
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
