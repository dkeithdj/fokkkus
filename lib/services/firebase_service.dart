import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fokkkus/models/todo.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _uid;

  String get uid => _uid!;
  FirebaseAuth get auth => _firebaseAuth;
  FirebaseFirestore get firestore => _firestore;

  customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getTodo() async {
    return _firestore
        .collection('user')
        .doc(_uid)
        .collection('notes')
        .snapshots();
    // .where('isChecked', isEqualTo: isChecked)
    // .orderBy('timestamp', descending: true)
  }

  addTodo(Todo todo) {
    return _firestore
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notes')
        .withConverter(
            fromFirestore: Todo.fromFirestore,
            toFirestore: (Todo todo, options) => todo.toFirestore())
        .add(todo)
        .then((value) => customSnackBar(content: "Successfully added"))
        .onError((error, _) => customSnackBar(content: "Failed to add todo"));
  }
}
