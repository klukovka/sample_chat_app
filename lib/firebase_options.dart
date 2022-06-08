// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBAdm_b42H3ZKN5UGvrdV-zmt3VH9BPSxs',
    appId: '1:598027064979:web:2604f91526f1612d97df66',
    messagingSenderId: '598027064979',
    projectId: 'sample-chat-8e691',
    authDomain: 'sample-chat-8e691.firebaseapp.com',
    storageBucket: 'sample-chat-8e691.appspot.com',
    measurementId: 'G-7HGMC2MB80',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_bB_TL0r938NM6O6DRJWWGxA_mfG6M0Q',
    appId: '1:598027064979:android:fbc48e57e741ff1497df66',
    messagingSenderId: '598027064979',
    projectId: 'sample-chat-8e691',
    storageBucket: 'sample-chat-8e691.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAna-LR364EM8y4p7QrfOA9n3NGSY4Rsxw',
    appId: '1:598027064979:ios:a9493bfa5197ef9897df66',
    messagingSenderId: '598027064979',
    projectId: 'sample-chat-8e691',
    storageBucket: 'sample-chat-8e691.appspot.com',
    iosClientId: '598027064979-r4ko05kcs3k0pfndo4k8q73jihat08r4.apps.googleusercontent.com',
    iosBundleId: 'com.example.sampleChatApp',
  );
}
