import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mavental/src/locator.dart';

import 'package:mavental/firebase_options/firebase_options_prod.dart';
import 'package:mavental/src/app.dart';

Future main() async {
  await initializeApp(
      name: "production",
      firebaseOptions: DefaultFirebaseOptions.currentPlatform);
  if (kIsWeb) {
    runApp(const MyApp());
  } else {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
    runApp(const MyApp());
    // FlutterError.onError = (errorDetails) {
    //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    // };
    // runZonedGuarded<Future<void>>(() async {
    //   runApp(const MyApp());
    // }, FirebaseCrashlytics.instance.recordError);
  }
}
