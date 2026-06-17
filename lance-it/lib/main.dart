import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lance-It',
      theme: AppTheme.lightTheme,
      home: Scaffold(
        body: Center(
          child: Text('Welcome to Lance-It'),
        ),
      ),
    );
  }
}