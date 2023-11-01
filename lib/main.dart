import 'package:firebase_core/firebase_core.dart';
import 'package:fitbit/src/app/app.dart';
import 'package:fitbit/src/app/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    Firebase.initializeApp(),
    dotenv.load(fileName: ".env"),
    initAppModule(),
  ]);

  initBlocObserver();

  runApp(const MyApp());
}
