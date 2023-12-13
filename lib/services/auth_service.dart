import 'package:fokkkus/globals.dart';
import 'package:fokkkus/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends FirebaseService {
  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    UserCredential auth = await super.auth.signInWithCredential(credential);
    User? user = auth.user;
    String uid = user!.uid;
    final userDoc = await super.firestore.collection('user').doc(uid).get();
    if (!userDoc.exists) {
      //TODO make focustime be a category instance
      await super
          .firestore
          .collection('user')
          .doc(uid)
          .set({'focusTime': '30', 'breakTime': '5'}).onError(
              (error, stackTrace) => SnackBarService.showSnackBar(
                  content: "Failed to create user, try again"));
    }
    return uid;
  }

// SignOut
  Future<void> signOut() async {
    return await super.auth.signOut().onError((error, stackTrace) =>
        SnackBarService.showSnackBar(content: "Error signing out. Try again."));
  }
}
