import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> signUpUser(String email, String password, String name) async {
    try {
      // Sign up the user
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Get the user's UID
      String uid = userCredential.user!.uid;

      // Store additional user details in Firestore
      await _firestore.collection('users').doc(uid).set({
        'uid': uid,
        'name': name,
        'email': email,
      });

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signInUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        final userDoc =
            await _firestore.collection('users').doc(user.uid).get();
        if (!userDoc.exists) {
          await _firestore.collection('users').doc(user.uid).set({
            'uid': user.uid,
            'name': googleUser.displayName ?? '',
            'email': googleUser.email,
          });
        }
        return user;
      }
    }
    return null;
  }

  Future<Map<String, dynamic>?> fetchUserProfile(String uid) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return snapshot.data() as Map<String, dynamic>?;
  }

  Future<bool> updateUserProfile(
      String uid, String name, String email, String password) async {
    try {
      // Update Firestore user document
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'name': name,
        'email': email,
      });

      User? user = FirebaseAuth.instance.currentUser;

      // Update email in Firebase Auth if it has been changed
      if (user != null && user.email != email) {
        await user.verifyBeforeUpdateEmail(email);
      }

      // Update password in Firebase Auth if a new password has been provided
      if (password.isNotEmpty) {
        await user?.updatePassword(password);
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteUserAccount() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .delete();
        await user.delete();

        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
