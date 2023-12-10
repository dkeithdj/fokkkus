import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fokkkus/models/category.dart';
import 'package:fokkkus/services/user_services.dart';

class GetCategories {
  DocumentReference<Map<String, dynamic>> user = UserServices().getUser();

  // get the notes
  Stream<QuerySnapshot> getCategories() {
    return user.collection('categories').snapshots();
  }

  // add category
  addCategory(String name, String focusTime, String breakTime) {
    // create a new note
    final newCategoryTime =
        CategoryTime(name: name, focusTime: focusTime, breakTime: breakTime);
    user
        .collection('categories')
        .doc(newCategoryTime
            .getCategoryName()
            .toString()
            .toLowerCase()
            .replaceAll(" ", ""))
        .set(newCategoryTime.toJson());
    return newCategoryTime;
  }

  // update notes using the note id
  updateCategory(String focusTime, String breakTime, String id) {
    // create a new note
    final changeCategoryTime = CategoryTime(
      focusTime: focusTime,
      breakTime: breakTime,
    );
    user.collection('categories').doc(id).update(changeCategoryTime.toJson());
    return changeCategoryTime;
  }

  //  delete notes using the note id
  deleteCategory(String id) {
    user.collection('categories').doc(id).delete();
  }
}
