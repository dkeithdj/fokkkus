import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServices {
  final String _userId = FirebaseAuth.instance.currentUser!.uid;

  getUser() {
    return FirebaseFirestore.instance.collection('user').doc(_userId);
  }
}
