import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../resource/colors.dart';

// class AuthMethod {
//   bool isLoading = false;
//
//   Future<void> register(email, password) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: email.text, password: password.text);
//
//       SnackBar(
//         backgroundColor: AppColors().secondaryColor,
//         content: Text(
//           "You registered successfully 🎉🎉",
//           style: TextStyle(fontSize: 16.0, color: AppColors().greyText),
//         ),
//       );
//
//
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print("Password Provided is too Weak");
//
//           const SnackBar(
//             backgroundColor: Colors.orangeAccent,
//             content: Text(
//               "Password Provided is too Weak",
//               style: TextStyle(fontSize: 18.0, color: Colors.black),
//             ),
//           );
//       } else if (e.code == 'email-already-in-use') {
//           const SnackBar(
//             backgroundColor: Colors.orangeAccent,
//             content: Text(
//               "Account Already exists",
//               style: TextStyle(fontSize: 18.0, color: Colors.black),
//             ),
//           );
//       }
//     }
//   }
// }


class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChange => _auth.authStateChanges();


  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Error Occured'),
          content: Text(e.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text("OK"))
          ],
        ),
      );
    }
  }

  // SignUp the user using Email and Password
  Future<void> signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: Text('Error Occured'),
              content: Text(e.toString()),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text("OK"))
              ]));
    } catch (e) {
      if (e == 'email-already-in-use') {
        print('Email already in use.');
      } else {
        print('Error: $e');
      }
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}