import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Add your providers here
      ],
      child: const LanceItApp(),
    ),
  );
}

class LanceItApp extends StatelessWidget {
  const LanceItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lance-It',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Welcome to Lance-It'),
        ),
      ),
    );
  }
}
