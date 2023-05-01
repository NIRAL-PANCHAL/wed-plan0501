import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Authentication {

  static SnackBar customSnackBar ({required String content}) {
    return SnackBar(
        content: Text(
            ""
        ));
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken
      );

      try {
        final UserCredential userCredential = await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'accout-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
              Authentication.customSnackBar(
                content : 'The account already exists with a diferent credential',
              )
          );
        }
        else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
              Authentication.customSnackBar(
                content : 'Error occured while accessing credentials. try again.',
              )
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content : 'Error occured using GoogleSign In. try again.',
            )
        );
      }
    }
    return user;
  }

  static Future<FirebaseApp> initializeFirebase({required BuildContext context}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null){

    }
    return firebaseApp;
  }

  static Future<void> signOut ({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      await FirebaseAuth.instance.signOut();
    }catch (e){
      ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(content: 'Error signing out. Try again.',
          )
      );
    }
  }
}