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
    apiKey: 'AIzaSyB8E6GVj-qOVfxqYF3cjX-k_3iCGSHq5ZI',
    appId: '1:675182934460:web:f6f8824efcb1397c2a53b9',
    messagingSenderId: '675182934460',
    projectId: 'codesthinker-78dba',
    authDomain: 'codesthinker-78dba.firebaseapp.com',
    storageBucket: 'codesthinker-78dba.appspot.com',
    measurementId: 'G-8TBE2FY4WD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIpeK6DP8-Oe1Lmf75TfKUsqD8KwRtOxs',
    appId: '1:675182934460:android:5d7c79703d32bde72a53b9',
    messagingSenderId: '675182934460',
    projectId: 'codesthinker-78dba',
    storageBucket: 'codesthinker-78dba.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD7z8ERe1sHNVhBj9DDFnfmI6FhI5tw9-M',
    appId: '1:675182934460:ios:4a5b2a0bd474aee82a53b9',
    messagingSenderId: '675182934460',
    projectId: 'codesthinker-78dba',
    storageBucket: 'codesthinker-78dba.appspot.com',
    iosBundleId: 'com.example.fbs',
  );
}
