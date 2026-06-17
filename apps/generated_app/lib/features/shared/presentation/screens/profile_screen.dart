import 'package:flutter/material.dart';
import '../widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    // Replace with real user data
    final userProfile = {
      'name': 'John Doe',
      'skills': ['Flutter', 'Dart', 'Firebase'],
      'rating': 4.7,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: ProfileCard(
          name: userProfile['name'],
          skills: userProfile['skills'],
          rating: userProfile['rating'],
        ),
      ),
    );
  }
}