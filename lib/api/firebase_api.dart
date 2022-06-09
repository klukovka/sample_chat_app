import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@lazySingleton
class FirebaseApi {
  late final FirebaseAuth _auth;
  late final FirebaseFirestore _firestore;

  FirebaseApi() {
    _auth = FirebaseAuth.instance;
    _firestore = FirebaseFirestore.instance;
  }

  Stream<User?> get authState => _auth.authStateChanges();

  Stream<QuerySnapshot<Map<String, dynamic>>> get people => _firestore
      .collection('users')
      .where('uid', isNotEqualTo: _auth.currentUser?.uid)
      .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(String chatId) =>
      _firestore
          .collection('messages')
          .where('chatId', isEqualTo: chatId)
          .snapshots();

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

  Future<QuerySnapshot<Map<String, dynamic>>> getUser(
    String userId,
  ) async {
    final users = _firestore.collection('users');
    return await users.where('uid', isEqualTo: userId).limit(1).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getChatWithUser(
    String userId,
  ) async {
    final chats = _firestore.collection('chats');
    final query = [
      [userId, _auth.currentUser?.uid],
      [_auth.currentUser?.uid, userId],
    ];

    final snapshots = await chats.where('users', whereIn: query).get();

    if (snapshots.docs.isEmpty) {
      await chats.add({
        'name': null,
        'photo': null,
        'owner': _auth.currentUser?.uid,
        'lastMessage': null,
        'users': [userId, _auth.currentUser?.uid],
        'uid': const Uuid().v4(),
      });
    }

    return await chats.where('users', whereIn: query).limit(1).get();
  }
}
