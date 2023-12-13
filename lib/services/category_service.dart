import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fokkkus/models/category.dart';
import 'package:fokkkus/services/firebase_service.dart';
import 'package:fokkkus/globals.dart';

class CategoryService extends FirebaseService {
  Stream<QuerySnapshot<Map<String, dynamic>>> getCategories() {
    return firestore
        .collection('user')
        .doc(uid)
        .collection('categories')
        .snapshots();
    // .where('isChecked', isEqualTo: isChecked)
    // .orderBy('timestamp', descending: true)
  }

  Future<DocumentSnapshot<Category>> getCategory(String categoryId) {
    final docRef = firestore
        .collection("user")
        .doc(uid)
        .collection('categories')
        .doc(categoryId)
        .withConverter(
            fromFirestore: Category.fromFirestore,
            toFirestore: (Category category, _) => category.toFirestore())
        .get();
    return docRef;
  }

  addCategory(Category category) {
    return firestore
        .collection("user")
        .doc(uid)
        .collection('categories')
        .withConverter(
            fromFirestore: Category.fromFirestore,
            toFirestore: (Category category, options) => category.toFirestore())
        .add(category)
        .then((value) =>
            SnackBarService.showSnackBar(content: "Successfully added"))
        .onError((error, _) =>
            SnackBarService.showSnackBar(content: "Failed to add category"));
  }

  editCategory(String id, Category category) {
    final docRef =
        firestore.collection('user').doc(uid).collection('categories');
    if (id != category.category) {
      firestore.runTransaction((transaction) async {
        transaction.delete(docRef.doc(id));
        transaction.set(docRef.doc(category.category),
            {'focusTime': category.focusTime, 'breakTime': category.breakTime});
      }).then(
          (value) => SnackBarService.showSnackBar(content: "Edited category"),
          onError: (e) =>
              SnackBarService.showSnackBar(content: "Failed to edit category"));
    }
    docRef.doc(id).update({
      'focusTime': category.focusTime,
      'breakTime': category.breakTime
    }).then((value) => SnackBarService.showSnackBar(content: 'Edited category'),
        onError: (e) =>
            SnackBarService.showSnackBar(content: 'Failed to edit category'));
  }

  deleteCategory(String id) {
    firestore
        .collection('user')
        .doc(uid)
        .collection('categories')
        .doc(id)
        .delete()
        .then(
            (value) =>
                SnackBarService.showSnackBar(content: 'Successfully deleted'),
            onError: (e) => SnackBarService.showSnackBar(
                content: 'Failed to delete category'));
  }
}
