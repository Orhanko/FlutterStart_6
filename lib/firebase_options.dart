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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhQmnrtjqVK0UFb76JjwUQOSGl_ND3N_I',
    appId: '1:720311075768:android:1a12f4ed37d7ee48db054d',
    messagingSenderId: '720311075768',
    projectId: 'flutter-start-ca48a',
    databaseURL: 'https://flutter-start-ca48a-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-start-ca48a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCyxaFgOLjTc7z-gl3lLLnLIQl1A6VZCak',
    appId: '1:720311075768:ios:f611cc7bc1004e1bdb054d',
    messagingSenderId: '720311075768',
    projectId: 'flutter-start-ca48a',
    databaseURL: 'https://flutter-start-ca48a-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-start-ca48a.firebasestorage.app',
    iosBundleId: 'com.orhanpojskic.chatapp',
  );

}