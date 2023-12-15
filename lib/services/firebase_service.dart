import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String get uid => _firebaseAuth.currentUser!.uid;
  FirebaseAuth get auth => _firebaseAuth;
  FirebaseFirestore get firestore => _firestore;
}
