import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sample_chat_app/sample_chat_app.dart';

import 'config/di.dart';
import 'firebase_options.dart';

const _useEmulator = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (_useEmulator) {
    await _connectToFirebaseEmulator();
  }
  await configureDependencies();
  runApp(SampleChatApp.create());
}

Future<void> _connectToFirebaseEmulator() async {
  const firestorePort = 8080;
  const authPort = 9099;
  final localhost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  FirebaseFirestore.instance.settings = Settings(
    host: '$localhost:$firestorePort',
    sslEnabled: false,
    persistenceEnabled: false,
  );

  await FirebaseAuth.instance.useAuthEmulator(localhost, authPort);
}
