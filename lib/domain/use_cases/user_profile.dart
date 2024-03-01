import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

void setUserProfile(User? user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (user != null) {
    prefs.setString('name', user.displayName ?? user.uid);
    prefs.setString('uid', user.uid);
    prefs.setString('email', user.email ?? "");
    prefs.setString(
        'imageURL',
        user.photoURL ??
            "https://static.vecteezy.com/system/resources/previews/005/129/844/non_2x/profile-user-icon-isolated-on-white-background-eps10-free-vector.jpg");
  }
}
