import 'package:flutter/material.dart';
import 'package:g4c/domain/use_cases/personality_quiz_runner.dart';
import 'package:g4c/presentation/views/job_des.dart';
import 'package:g4c/presentation/views/job_role_main.dart';
import 'package:g4c/presentation/views/login.dart';
import 'package:g4c/presentation/views/personality_quizes_main.dart';
import 'package:g4c/presentation/views/personality_welcome_page.dart';
import 'package:g4c/presentation/views/profile_page.dart';
import 'package:g4c/presentation/views/progress_tracker.dart';
import 'package:g4c/presentation/views/register.dart';

void navtoProfilePage(BuildContext context, bool pop) {
  pop ? Navigator.pop(context) : null;
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const ProfilePage()));
}

//TODO : UNIMPLEMENTED
void navtoWelcomePage(BuildContext context, bool pop) {
  throw UnimplementedError();
  // pop ? Navigator.pop(context) : null;
  // Navigator.push(context,
  // MaterialPageRoute(builder: (context) => const WelcomePagePersonality()));
}

void navtoPersQuiz(BuildContext context, bool pop) {
  pop ? Navigator.pop(context) : null;
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const PersonalityMain()));
}

void navtoQuizRunner(BuildContext context, bool pop) {
  pop ? Navigator.pop(context) : null;
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const PersonalityQuizRunner()));
}

//TODO : UNIMPLEMENTED
void navtoQuizResults(BuildContext context, bool pop) {
  throw UnimplementedError();
  // pop ? Navigator.pop(context) : null;
  // Navigator.push(context,
  //     MaterialPageRoute(builder: (context) => const PersQuizResults()));
}

void navtoProgressTracker(BuildContext context, bool pop) {
  pop ? Navigator.pop(context) : null;
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const ProgressTracker()));
}

//TODO : UNIMPLEMENTED
void navtoProgTrackCourseDetails(BuildContext context, bool pop) {
  throw UnimplementedError();
  // pop ? Navigator.pop(context) : null;
  // Navigator.push(context,
  //     MaterialPageRoute(builder: (context) => const PersQuizResults()));
}

//TODO : UNIMPLEMENTED
void navtoProgTrackAddCourse(BuildContext context, bool pop) {
  throw UnimplementedError();
  // pop ? Navigator.pop(context) : null;
  // Navigator.push(context,
  //     MaterialPageRoute(builder: (context) => const PersQuizResults()));
}

void navtoJobRoles(BuildContext context, bool pop) {
  pop ? Navigator.pop(context) : null;
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const JobRoleMain()));
}

void navtoJobDescription(BuildContext context, bool pop, role) {
  pop ? Navigator.pop(context) : null;
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => JobDescription(role: role)));
}

void navtoLogin(BuildContext context, bool pop) {
  pop ? Navigator.pop(context) : null;
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const LoginPage()));
}

void navtoRegistration(BuildContext context, bool pop) {
  pop ? Navigator.pop(context) : null;
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const RegisterPage()));
}

//TODO : UNIMPLEMENTED
void navtoUserDetailEntry(BuildContext context, bool pop) {
  throw UnimplementedError();
  // pop ? Navigator.pop(context) : null;
  // Navigator.push(context,
  //     MaterialPageRoute(builder: (context) => const UserDetailEntry()));
}

void logout(BuildContext context) {
  Navigator.pop(context);
  //TODO : Implement sessions logout
  Navigator.popUntil(context, (route) => false);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const LoginPage()),
  );
}
