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
        return macos;
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
    apiKey: 'AIzaSyB1B3GunmeVh57KfkGqfMUAxGw7Qd9vQUU',
    appId: '1:894258455559:web:9ee53b8d30c21ba302b6a2',
    messagingSenderId: '894258455559',
    projectId: 'flutter-login-rigister',
    authDomain: 'flutter-login-rigister.firebaseapp.com',
    storageBucket: 'flutter-login-rigister.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcPkmcO-WU5rraNY_Z5K0--HkqTVhqqsg',
    appId: '1:894258455559:android:735cb1438d04359c02b6a2',
    messagingSenderId: '894258455559',
    projectId: 'flutter-login-rigister',
    storageBucket: 'flutter-login-rigister.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDSQaUbukU_qo_gscOkKKdwxGnu1Hvscu8',
    appId: '1:894258455559:ios:396c0fb2277aa2c302b6a2',
    messagingSenderId: '894258455559',
    projectId: 'flutter-login-rigister',
    storageBucket: 'flutter-login-rigister.appspot.com',
    iosBundleId: 'com.example.trainGetapi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDSQaUbukU_qo_gscOkKKdwxGnu1Hvscu8',
    appId: '1:894258455559:ios:02c65225b47e4da202b6a2',
    messagingSenderId: '894258455559',
    projectId: 'flutter-login-rigister',
    storageBucket: 'flutter-login-rigister.appspot.com',
    iosBundleId: 'com.example.trainGetapi.RunnerTests',
  );
}
