import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:name/page/signin_page.dart';

class AuthServer {
  static final _auth = FirebaseAuth.instance;

  static bool isLoggedIn() {
    final User? firebaseUser = _auth.currentUser;
    return firebaseUser != null;
  }

  static Future<User?> singInUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    User fierbaseUser = _auth.currentUser!;
    return fierbaseUser;
  }

  static Future<User?> singUpUser(String email, String password) async {
    var authResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = authResult.user;
    return user;
  }

  static void singOutUser(BuildContext context) {
    _auth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const SigninPage();
    }));
  }
}
