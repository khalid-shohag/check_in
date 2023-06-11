import 'package:flutter/material.dart';
import 'package:check_in/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:check_in/shared/Option.dart';
import 'dart:async';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Option.apiKey,
            appId: Option.appId,
            messagingSenderId: Option.messagingSenderId,
            projectId: Option.projectId)
    );
  }
  else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A simple app to check login info.',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        brightness: Brightness.light,
      ),
      home: Home(),
    );
  }
}
