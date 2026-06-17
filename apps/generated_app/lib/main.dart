import 'package:flutter/material.dart';
import 'package:lance_it/screens/auth/login_screen.dart';

void main() {
  runApp(LanceItApp());
}

class LanceItApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lance-It',
      theme: ThemeData(
        primaryColor: Color(0xFF2B3137),
        accentColor: Color(0xFF2ECC71),
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: LoginScreen(),
    );
  }
}
