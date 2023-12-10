import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fokkkus/models/note.dart';
import 'package:fokkkus/services/user_services.dart';

class GetNotes {
  DocumentReference<Map<String, dynamic>> user = UserServices().getUser();

  // get the notes
  Stream<QuerySnapshot> getNotes() {
    return user.collection('notes').snapshots();
  }

  // add notes
  addNotes(String title, String content) {
    // create a new note
    final newNote = Note(
      title: title,
      content: content,
      date: DateTime.now().toString(),
    );
    user.collection('notes').add(newNote.toJson());
    return newNote;
  }

  // update notes using the note id
  updateNotes(String title, String content, String id) {
    // create a new note
    final changeNote = Note(
      title: title,
      content: content,
      date: DateTime.now().toString(),
    );
    user.collection('notes').doc(id).update(changeNote.toJson());
    return changeNote;
  }

  //  delete notes using the note id
  deleteNotes(String id) {
    user.collection('notes').doc(id).delete();
  }
}
