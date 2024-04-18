import 'package:flutter/material.dart';

class JobRoleCard extends StatelessWidget {
  final Image jobImage;
  final String jobName;

  const JobRoleCard({super.key, required this.jobImage, required this.jobName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          jobImage,
          Expanded(
            child: Text(
              jobName.toUpperCase(),
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
