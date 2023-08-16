// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_prod.dart';
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
    apiKey: 'AIzaSyDLqjBobFKJ3hgv7xvfRPz-7zANVIiEJAA',
    appId: '1:158898518103:web:0a7e841cec8dc2c5544b12',
    messagingSenderId: '158898518103',
    projectId: 'goldenowl-mavental',
    authDomain: 'goldenowl-mavental.firebaseapp.com',
    storageBucket: 'goldenowl-mavental.appspot.com',
    measurementId: 'G-9N5GQ0H8SH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDTtxnrphBRcXdq0oJjemEEE78Z5BHACyo',
    appId: '1:158898518103:android:243bff88f559e7a6544b12',
    messagingSenderId: '158898518103',
    projectId: 'goldenowl-mavental',
    storageBucket: 'goldenowl-mavental.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbjnIWoGH8Sa8utPPtfajtJem62j4638o',
    appId: '1:158898518103:ios:ffbaebd452266135544b12',
    messagingSenderId: '158898518103',
    projectId: 'goldenowl-mavental',
    storageBucket: 'goldenowl-mavental.appspot.com',
    iosClientId:
        '158898518103-1m5n0vbiujj5arbrdb8srituad598s0s.apps.googleusercontent.com',
    iosBundleId: 'com.maverick.go.mavental',
  );
}
