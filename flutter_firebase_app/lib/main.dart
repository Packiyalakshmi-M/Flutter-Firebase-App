import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/App.dart';
import 'package:flutter_firebase_app/Services/FirebaseAuthService/FirebaseAuthService.dart';
import 'package:flutter_firebase_app/Services/FirebaseAuthService/IFirebaseAuthService.dart';
import 'package:get_it/get_it.dart';

final GetIt getit = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const App());
  getit.registerSingleton<IFirebaseAuthService>(FirebaseAuthService());
}
