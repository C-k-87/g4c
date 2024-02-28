import 'package:flutter/material.dart';
import 'package:g4c/data/entities/quiz_scores.dart';
import 'package:g4c/domain/use_cases/personality_quiz_runner.dart';
import 'package:g4c/presentation/views/job_des.dart';
import 'package:g4c/presentation/views/job_role_main.dart';
import 'package:g4c/presentation/views/login.dart';
import 'package:g4c/presentation/views/personality_quizes_main.dart';
import 'package:g4c/presentation/views/profile_page.dart';
import 'package:g4c/presentation/views/progress_tracker.dart';
import 'package:g4c/presentation/views/quiz_results.dart';
import 'package:g4c/presentation/views/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

void navtoProfilePage(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const ProfilePage()));
}

//TODO : UNIMPLEMENTED
void navtoWelcomePage(BuildContext context, bool pop) {
  throw UnimplementedError();
  // pop ? Navigator.pop(context) : null;
  // Navigator.push(context,
  // MaterialPageRoute(builder: (context) => const WelcomePagePersonality()));
}

void navtoPersQuiz(BuildContext context) {
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => const PersonalityMain()));
}

void navtoQuizRunner(BuildContext context) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const PersonalityQuizRunner()));
}

void navtoQuizResults(BuildContext context, QuizScores quizScores) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizResults(
          quizScores: quizScores,
        ),
      ));
}

void navtoProgressTracker(BuildContext context) {
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => const ProgressTracker()));
}

//TODO : UNIMPLEMENTED
void navtoProgTrackCourseDetails(BuildContext context) {
  throw UnimplementedError();
  // Navigator.push(context,
  //     MaterialPageRoute(builder: (context) => const ___()));
}

//TODO : UNIMPLEMENTED
void navtoProgTrackAddCourse(BuildContext context) {
  throw UnimplementedError();
  // Navigator.push(context,
  //     MaterialPageRoute(builder: (context) => const ___()));
}

void navtoJobRoles(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const JobRoleMain()));
}

void navtoJobDescription(BuildContext context, role) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => JobDescription(role: role)));
}

void navtoLogin(BuildContext context) {
  Navigator.popUntil(context, (route) => false);
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const LoginPage()));
}

void navtoRegistration(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const RegisterPage()));
}

//TODO : UNIMPLEMENTED
void navtoUserDetailEntry(BuildContext context, bool pop) {
  throw UnimplementedError();
  // pop ? Navigator.pop(context) : null;
  // Navigator.pushReplacement(context,
  //     MaterialPageRoute(builder: (context) => const UserDetailEntry()));
}

void logout(BuildContext context) {
  logoutSession();
  navtoLogin(context);
  print("logged out");
}

Future<void> logoutSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isSignedIn', false);
}
