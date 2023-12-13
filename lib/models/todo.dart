import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String title;
  final bool? isChecked;
  final Timestamp? timestamp;
  Todo({required this.title, this.isChecked, this.timestamp});

  factory Todo.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Todo(
        title: data?['title'],
        isChecked: data?['isChecked'],
        timestamp: data?['timestamp'] ?? Timestamp.now());
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      if (isChecked != null) 'isChecked': isChecked,
      if (timestamp != null) 'timestamp': timestamp
    };
  }
}
