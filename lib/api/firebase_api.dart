import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseApi {
  late final FirebaseAuth _auth;
  late final FirebaseFirestore _firestore;

  FirebaseApi() {
    _auth = FirebaseAuth.instance;
    _firestore = FirebaseFirestore.instance;
  }

  Stream<User?> get authState => _auth.authStateChanges();

  Future<void> googleLogin() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  Future<void> createUser() async {
    final users = _firestore.collection('users');
    final snapshots = await users
        .where('uid', isEqualTo: _auth.currentUser?.uid)
        .limit(1)
        .get();

    if (snapshots.docs.isEmpty) {
      await users.add({
        'name': _auth.currentUser?.displayName,
        'phone': null,
        'email': _auth.currentUser?.email,
        'status': 'Available',
        'uid': _auth.currentUser?.uid,
        'photo': _auth.currentUser?.photoURL,
      });
    }
  }
}
