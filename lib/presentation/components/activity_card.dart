import 'package:flutter/material.dart';
import 'package:g4c/domain/use_cases/routing.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.0),
      clipBehavior: Clip.antiAlias,
      color: const Color.fromARGB(255, 195, 255, 195),
      child: InkWell(
        onTap: () {
          navtoProgTrackAddCourse(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0))),
              child: const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
                child: Text(
                  "Activities",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Card(
                elevation: 10.0,
                child: Text("Activities"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
