import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirebaseApi {
  late final FirebaseAuth _auth;

  FirebaseApi() {
    _auth = FirebaseAuth.instance;
  }
}
