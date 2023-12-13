import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  // Sign In
  signInWithGoogle() async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();

        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');
        googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

        // Once signed in, return the UserCredential
        await FirebaseAuth.instance.signInWithPopup(googleProvider);
      }
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);
      final user = FirebaseAuth.instance.currentUser!;
      final uid = user.uid;
      final userDoc =
          await FirebaseFirestore.instance.collection('user').doc(uid).get();
      if (!userDoc.exists) {
        await FirebaseFirestore.instance
            .collection('user')
            .doc(uid)
            .set({'focusTime': '30', 'breakTime': '5'});
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        customSnackBar(content: "Account exists with different credential");
      } else if (e.code == 'invalid-credential') {
        customSnackBar(content: "Invalid credential");
      }
    }
  }

// SignOut
  signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      customSnackBar(content: "Error signing out. Try again.");
      print(e);
    }
  }
}
