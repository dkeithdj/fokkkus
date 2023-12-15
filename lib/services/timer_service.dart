import 'package:fokkkus/services/firebase_service.dart';

class TimerService extends FirebaseService {
// get the user's focus duration
  Future<String> getFocusDuration() async {
    return await firestore
        .collection('user')
        .doc(uid)
        .get()
        .then((value) => value.data()!['focusTime']);
  }

// get the user's break duration
  Future<String> getBreakDuration() async {
    return await firestore
        .collection('user')
        .doc(uid)
        .get()
        .then((value) => value.data()!['breakTime']);
  }
}
