import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuthService authService = FirebaseAuthService();
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
        "565471500049-too7gv7ufbarpssak0itep2035cm8kvv.apps.googleusercontent.com");

Future<User?> signIn(String email, String password) async {
  User? user = await authService.signInWithEmailAndPassword(email, password);

  if (user != null) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isSignedIn', true);
    return user;
  } else {
    print('User not found');
  }
  return null;
}

Future<User?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      final UserCredential authResult =
          await firebaseAuth.signInWithCredential(credential);
      final User? user = authResult.user;
      print("Got user ${user?.email}. Hello ${user?.displayName}");
      return user;
    }
  } catch (e) {
    print("Sign in failed : ${e.toString()}");
  }

  return null;
}

Future<void> logoutSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await googleSignIn.signOut();
  await firebaseAuth.signOut();
  await prefs.setBool('isSignedIn', false);
}

Future<User?> signUp(String email, String password, String username,
    BuildContext context) async {
  User? user = await authService.signUp(email, password, username, context);
  return user;
}

class FirebaseAuthService {
  Future<User?> signUp(String email, String password, String username,
      BuildContext context) async {
    try {
      UserCredential credential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = credential.user;
      if (user != null) {
        await user.updateDisplayName(username);
        await user.reload();
        user = firebaseAuth.currentUser;
        return user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The email address is already in use.');
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Error: Email in use")));
      } else {
        print('An error occurred: ${e.code}');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        print('Invalid email or password.');
      } else {
        print('An error occurred: ${e.code}');
      }
    }
    return null;
  }
}
