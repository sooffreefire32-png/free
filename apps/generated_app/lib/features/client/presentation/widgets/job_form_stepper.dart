import 'package:flutter/material.dart';

class JobFormStepper extends StatefulWidget {
  const JobFormStepper({super.key});

  @override
  _JobFormStepperState createState() => _JobFormStepperState();
}

class _JobFormStepperState extends State<JobFormStepper> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _currentStep,
      onStepTapped: (step) => setState(() => _currentStep = step),
      onStepContinue: () {
        if (_formKey.currentState!.validate()) {
          if (_currentStep < 2) {
            setState(() => _currentStep += 1);
          } else {
            // Submit the job form
          }
        }
      },
      onStepCancel: () {
        if (_currentStep > 0) {
          setState(() => _currentStep -= 1);
        }
      },
      steps: [
        Step(
          title: const Text('Title'),
          content: TextFormField(
            decoration: const InputDecoration(labelText: 'Job Title'),
          ),
          isActive: _currentStep >= 0,
        ),
        Step(
          title: const Text('Description'),
          content: TextFormField(
            decoration: const InputDecoration(labelText: 'Job Description'),
          ),
          isActive: _currentStep >= 1,
        ),
        Step(
          title: const Text('Budget'),
          content: TextFormField(
            decoration: const InputDecoration(labelText: 'Job Budget'),
          ),
          isActive: _currentStep >= 2,
        ),
      ],
    );
  }
}