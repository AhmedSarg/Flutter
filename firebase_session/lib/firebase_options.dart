// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
// / import 'firebase_options.dart';
// / // ...
// / await Firebase.initializeApp(
// /   options: DefaultFirebaseOptions.currentPlatform,
// / );
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
    apiKey: 'AIzaSyBd9Ydp4kPKNJUPx59fRMJiDjkNkUATBlQ',
    appId: '1:760905889215:web:cb9adc001704b384c55d0a',
    messagingSenderId: '760905889215',
    projectId: 'fir-session-eb3b5',
    authDomain: 'fir-session-eb3b5.firebaseapp.com',
    storageBucket: 'fir-session-eb3b5.appspot.com',
    measurementId: 'G-VR5YL6FT1M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGlJELI2fFWzDv9z7IWgTw1187OtOH1TY',
    appId: '1:760905889215:android:84050845f08ccb8ac55d0a',
    messagingSenderId: '760905889215',
    projectId: 'fir-session-eb3b5',
    storageBucket: 'fir-session-eb3b5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRD1og5-rAxG0lfciAIlbSrbAXU-bDbx8',
    appId: '1:760905889215:ios:46bfee143f669b31c55d0a',
    messagingSenderId: '760905889215',
    projectId: 'fir-session-eb3b5',
    storageBucket: 'fir-session-eb3b5.appspot.com',
    iosClientId:
        '760905889215-34cme644cojg19quj648p2f1bulq9ae3.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseSession',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRD1og5-rAxG0lfciAIlbSrbAXU-bDbx8',
    appId: '1:760905889215:ios:46bfee143f669b31c55d0a',
    messagingSenderId: '760905889215',
    projectId: 'fir-session-eb3b5',
    storageBucket: 'fir-session-eb3b5.appspot.com',
    iosClientId:
        '760905889215-34cme644cojg19quj648p2f1bulq9ae3.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseSession',
  );
}
