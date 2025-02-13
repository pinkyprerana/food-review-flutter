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
    apiKey: 'AIzaSyCnsAXYjZCGIbcSWTnnmIxiOJemK58_e4I',
    appId: '1:807325107906:android:4bd19934582ecd5e131d5b',
    messagingSenderId: '807325107906',
    projectId: 'forthetable-bc1a5',
    storageBucket: 'forthetable-bc1a5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnm-aWjyEJrsnQpifaWhTxxqLMIMq-25c',
    appId: '1:807325107906:ios:06fbef946e196ade131d5b',
    messagingSenderId: '807325107906',
    projectId: 'forthetable-bc1a5',
    storageBucket: 'forthetable-bc1a5.appspot.com',
    androidClientId: '807325107906-9u6dmerpf1afvhb3mh1gsmg85el6f5qe.apps.googleusercontent.com',
    iosClientId: '807325107906-9jmjt7b8pf54mfadhf7iea2cd6f9dl9m.apps.googleusercontent.com',
    iosBundleId: 'com.example.forTheTable',
  );

}