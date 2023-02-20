import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../resource/colors.dart';

class AuthMethod {
  bool isLoading = false;

  Future<void> register(email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);

      SnackBar(
        backgroundColor: AppColors().secondaryColor,
        content: Text(
          "You registered successfully 🎉🎉",
          style: TextStyle(fontSize: 16.0, color: AppColors().greyText),
        ),
      );


    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("Password Provided is too Weak");

          const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Password Provided is too Weak",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          );
      } else if (e.code == 'email-already-in-use') {
          const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Account Already exists",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          );
      }
    }
  }
}
