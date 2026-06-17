import 'package:flutter/material.dart';

import '../widgets/job_form_stepper.dart';

class JobPostingScreen extends StatelessWidget {
  const JobPostingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post a Job'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: JobFormStepper(),
      ),
    );
  }
}