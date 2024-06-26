import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';
import 'package:g4c/presentation/components/job_role_card.dart';
import 'package:g4c/presentation/components/text_fields.dart';

class JobDescription extends StatelessWidget {
  final dynamic role;

  const JobDescription({
    super.key,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    String jobName = role["name"];
    Image jobImage = Image(
        image: AssetImage('asset_lib/images/roleimages/${role["image"]}'));
    return Scaffold(
      appBar: G4CAppBar('Job Roles', false),
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
          const SizedBox(height: 5.0),
          body(role["skills"]["soft"]),
          const SizedBox(height: 15.0),
          subheading("Technical Skills"),
          const SizedBox(height: 5.0),
          body(role["skills"]["tech"]),
          const SizedBox(height: 20.0),
          //heading("Related Course Modules"),
          //courseCard(role["courses"]),
          heading("Related Course Modules"),
          subheading("Soft Skill Courses "),
          const SizedBox(height: 5.0),
          body(role["courses"]["soft"]),
          const SizedBox(height: 15.0),
          subheading("Technical Skill Courses"),
          const SizedBox(height: 5.0),
          body(role["courses"]["tech"]),
        ],
      ),
    );
  }
}
