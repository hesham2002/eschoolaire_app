// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyC29HfcDSjmtlCTZEGLTTqSbSKs5eAymxE',
    appId: '1:630497190888:web:d9305464c7610f6a95fa5d',
    messagingSenderId: '630497190888',
    projectId: 'eschoolapp-547f5',
    authDomain: 'eschoolapp-547f5.firebaseapp.com',
    storageBucket: 'eschoolapp-547f5.appspot.com',
    measurementId: 'G-72GTH9VXWK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_qUc87UhkyWQYMLqz3Ls6vMraACjC2jA',
    appId: '1:630497190888:android:1891724a1cd707a695fa5d',
    messagingSenderId: '630497190888',
    projectId: 'eschoolapp-547f5',
    storageBucket: 'eschoolapp-547f5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBvQcbdEnCSlb5TZ5H7LpNZH1nL-gjeco',
    appId: '1:630497190888:ios:1c5d71aa98e4d24b95fa5d',
    messagingSenderId: '630497190888',
    projectId: 'eschoolapp-547f5',
    storageBucket: 'eschoolapp-547f5.appspot.com',
    iosBundleId: 'com.example.eschoolaireApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBvQcbdEnCSlb5TZ5H7LpNZH1nL-gjeco',
    appId: '1:630497190888:ios:1c5d71aa98e4d24b95fa5d',
    messagingSenderId: '630497190888',
    projectId: 'eschoolapp-547f5',
    storageBucket: 'eschoolapp-547f5.appspot.com',
    iosBundleId: 'com.example.eschoolaireApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC29HfcDSjmtlCTZEGLTTqSbSKs5eAymxE',
    appId: '1:630497190888:web:cc8f3783b16081a095fa5d',
    messagingSenderId: '630497190888',
    projectId: 'eschoolapp-547f5',
    authDomain: 'eschoolapp-547f5.firebaseapp.com',
    storageBucket: 'eschoolapp-547f5.appspot.com',
    measurementId: 'G-34ER0HW1MP',
  );
}
