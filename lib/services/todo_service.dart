import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fokkkus/models/todo.dart';
import 'package:fokkkus/services/firebase_service.dart';
import 'package:fokkkus/globals.dart';

class TodoService extends FirebaseService {
  Stream<QuerySnapshot<Map<String, dynamic>>> getTodo() {
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
        .then((value) =>
            SnackBarService.showSnackBar(content: "Successfully added"))
        .onError((error, _) =>
            SnackBarService.showSnackBar(content: "Failed to add todo"));
  }

  checkTask(String id, bool isChecked) {
    firestore
        .collection('user')
        .doc(uid)
        .collection('notes')
        .doc(id)
        .update({'isChecked': !isChecked}).then(
            (value) => SnackBarService.showSnackBar(content: 'Checked task'),
            onError: (e) =>
                SnackBarService.showSnackBar(content: "Failed to update todo"));
  }

  editTask(String id, String todoText) {
    firestore
        .collection('user')
        .doc(uid)
        .collection('notes')
        .doc(id)
        .update({'title': todoText}).then(
            (value) => SnackBarService.showSnackBar(content: 'edited task'),
            onError: (e) =>
                SnackBarService.showSnackBar(content: 'failed to edit task'));
  }

  void deleteTodo(String id) {
    firestore
        .collection('user')
        .doc(uid)
        .collection('notes')
        .doc(id)
        .delete()
        .then(
            (value) =>
                SnackBarService.showSnackBar(content: 'Successfully deleted'),
            onError: (e) =>
                SnackBarService.showSnackBar(content: 'Failed to delete todo'));
  }

  Future<int> totalNotes() {
    return firestore
        .collection('user')
        .doc(uid)
        .collection('notes')
        .count()
        .get()
        .then((value) => value.count);
  }
}
