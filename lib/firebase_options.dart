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
    apiKey: 'AIzaSyCWGQIULo_4YABY9pMRU5IvLy1T5-qSEgA',
    appId: '1:663337299852:web:b69be2f400fa61b049f0a9',
    messagingSenderId: '663337299852',
    projectId: 'erderis',
    authDomain: 'erderis.firebaseapp.com',
    storageBucket: 'erderis.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWGQIULo_4YABY9pMRU5IvLy1T5-qSEgA',
    appId: '1:663337299852:android:3b5e8eccc7289a9c49f0a9',
    messagingSenderId: '663337299852',
    projectId: 'erderis',
    storageBucket: 'erderis.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWGQIULo_4YABY9pMRU5IvLy1T5-qSEgA',
    appId: '1:663337299852:ios:80ffb02e2e1cc1e249f0a9',
    messagingSenderId: '663337299852',
    projectId: 'erderis',
    storageBucket: 'erderis.appspot.com',
    iosClientId:
        '663337299852-kv4ibgddd2gi9ohhrkr2g5tg01fmntrh.apps.googleusercontent.com',
    iosBundleId: 'id.deris.portfolio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCWGQIULo_4YABY9pMRU5IvLy1T5-qSEgA',
    appId: '1:663337299852:ios:80ffb02e2e1cc1e249f0a9',
    messagingSenderId: '663337299852',
    projectId: 'erderis',
    storageBucket: 'erderis.appspot.com',
    iosClientId:
        '663337299852-kv4ibgddd2gi9ohhrkr2g5tg01fmntrh.apps.googleusercontent.com',
    iosBundleId: 'id.deris.portfolio',
  );
}
