import 'package:flutter/material.dart';

class MyStatsScreen extends StatelessWidget {
  static const routeName = '/my-stats';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Stats'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Stats',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Replace with StatsCard widget later
            Placeholder(fallbackHeight: 200, fallbackWidth: double.infinity),
          ],
        ),
      ),
    );
  }
}