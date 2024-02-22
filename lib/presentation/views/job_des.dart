import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';
import 'package:g4c/presentation/components/job_role_card.dart';

class JobDescription extends StatelessWidget {
  final dynamic role;

  const JobDescription({
    super.key,
    required this.role,
  });

  heading(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  subheading(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15.0),
      ),
    );
  }

  body(text) {
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

  courseCard(text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    String jobName = role["name"];
    Image jobImage = Image(
        image: AssetImage('asset_lib/images/roleimages/${role["image"]}'));
    return Scaffold(
      appBar: G4CAppBar('Job Roles', false),
      drawer: const G4CDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          JobRoleCard(jobImage: jobImage, jobName: jobName),
          heading("Description"),
          body(role["description"]),
          const SizedBox(height: 20.0),
          heading("Responsibilities"),
          body(role["responsibilities"]),
          const SizedBox(height: 20.0),
          heading("Skills"),
          subheading("Soft Skills"),
          body(role["skills"]["soft"]),
          subheading("Technical Skills"),
          body(role["skills"]["tech"]),
          const SizedBox(height: 20.0),
          heading("Related Course Modules"),
          courseCard(role["courses"]),
        ],
      ),
    );
  }
}
