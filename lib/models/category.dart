import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String category;
  final String focusTime;
  final String breakTime;
  Category(
      {required this.category,
      required this.focusTime,
      required this.breakTime});

  factory Category.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Category(
        category: data?['category'],
        focusTime: data?['focusTime'] ?? "25",
        breakTime: data?['breakTime'] ?? "5");
  }

  Map<String, dynamic> toFirestore() {
    return {
      category: category,
      focusTime: focusTime,
      breakTime: breakTime,
    };
  }
}
