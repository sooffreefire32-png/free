import 'package:flutter/material.dart';

class HireFreelancerScreen extends StatelessWidget {
  const HireFreelancerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hire Freelancer'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Implement hire logic here
          },
          child: const Text('Confirm and Hire'),
        ),
      ),
    );
  }
}