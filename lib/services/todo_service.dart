import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fokkkus/models/todo.dart';
import 'package:fokkkus/services/firebase_service.dart';

class TodoService extends FirebaseService {
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getTodo() async {
    return firestore
        .collection('user')
        .doc(uid)
        .collection('notes')
        .snapshots();
    // .where('isChecked', isEqualTo: isChecked)
    // .orderBy('timestamp', descending: true)
  }

  addTodo(Todo todo) {
    return firestore
        .collection("user")
        .doc(uid)
        .collection('notes')
        .withConverter(
            fromFirestore: Todo.fromFirestore,
            toFirestore: (Todo todo, options) => todo.toFirestore())
        .add(todo)
        .then((value) => customSnackBar(content: "Successfully added"))
        .onError((error, _) => customSnackBar(content: "Failed to add todo"));
  }
}
