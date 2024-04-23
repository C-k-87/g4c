import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:g4c/data/entities/quiz_scores.dart';
import 'package:g4c/presentation/views/contact_us.dart';
import 'package:g4c/presentation/views/personality_quiz_runner.dart';
import 'package:g4c/domain/use_cases/sign_in.dart';
import 'package:g4c/presentation/views/job_des.dart';
import 'package:g4c/presentation/views/job_role_main.dart';
import 'package:g4c/presentation/views/login.dart';
import 'package:g4c/presentation/views/personality_quizes_main.dart';
import 'package:g4c/presentation/views/personality_welcome_page.dart';
import 'package:g4c/presentation/views/profile_page.dart';
import 'package:g4c/presentation/views/prog_track_details.dart';
import 'package:g4c/presentation/views/progress_tracker.dart';
import 'package:g4c/presentation/views/quiz_results.dart';
import 'package:g4c/presentation/views/register.dart';
import 'package:g4c/presentation/views/user_detail_entry.dart';

import '../../data/entities/semester_item.dart';

void navtoProfilePage(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const ProfilePage()));
}

void navtoWelcomePage(BuildContext context) {
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => const WelcomePagePersonality()));
}

void navtoPersQuiz(BuildContext context) {
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => const PersonalityMain()));
}

void navtoQuizRunner(BuildContext context, {bool initial = false}) {
  initial
      ? Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const PersonalityQuizRunner()))
      : Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const PersonalityQuizRunner()));
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

void navtoQuizRetake(BuildContext context, QuizScores quizScores) {
  Navigator.push(
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

void navtoProgTrackCourseDetails(
    BuildContext context,
    String courseCode,
    List<SemesterItem> semesterItems,
    String degreeName,
    double gpa,
    double progress,
    List<FlSpot> spots) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProgTrackDetails(
          courseCode: courseCode,
          semesterItems: semesterItems,
          degreeName: degreeName,
          gpa: gpa,
          progress: progress,
          spots: spots,
        ),
      ));
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

void navtoUserDetailEntry(BuildContext context, [User? user]) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => UserDetails(
                user: user,
              )));
}

void navtoContactUs(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const ContactUs()));
}

void logout(BuildContext context) {
  logoutSession();
  navtoLogin(context);
}
