// ignore: file_names
import 'package:flutter/material.dart';
import 'package:g4c/JobDataModel.dart';

class JobDescription extends StatefulWidget {
  final JobModel job;

  const JobDescription({super.key, required this.job});

  @override
  State<JobDescription> createState() => _JobDescriptionState();
}

class _JobDescriptionState extends State<JobDescription> {
  @override
  Widget build(BuildContext context) {
    String jobtitle = widget.job.name; // 'JOB TITLE';
    String description = widget.job.description; //'Description';
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('asset_lib/images/imagebg.png'),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        // ignore: unnecessary_string_interpolations
                        jobtitle,
                        style: const TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        description,
                        style: const TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        "Responsibilities",
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        "Skills",
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text(
                        'Technical Skills',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 220,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text(
                        'Soft Skills',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
