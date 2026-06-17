import 'package:flutter/material.dart';
import 'auth/login_screen.dart';
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginScreen()));
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text('Lance It',
            style: TextStyle(fontSize: 36, color: Colors.white)),
      ),
    );
  }
}
