import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:just_jewelry/firebase_options.dart';
import 'package:just_jewelry/src/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initialize();
  runApp(const App());
}

Future<void> _initialize() {
  return Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
