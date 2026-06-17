import 'package:flutter/material.dart';

class RoleSelector extends StatelessWidget {
  final VoidCallback onHireTap;
  final VoidCallback onWorkTap;

  const RoleSelector({
    required this.onHireTap,
    required this.onWorkTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onHireTap,
          child: const Text('I want to Hire'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onWorkTap,
          child: const Text('I want to Work'),
        ),
      ],
    );
  }
}