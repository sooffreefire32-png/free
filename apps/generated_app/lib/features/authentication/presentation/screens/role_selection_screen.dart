import 'package:flutter/material.dart';
import 'package:lance_it/core/constants/colors.dart';
import 'package:lance_it/core/widgets/role_selector.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Role', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'What would you like to do?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            RoleSelector(
              label: 'I want to Hire',
              onTap: () {
                Navigator.pushNamed(context, '/clientDashboard');
              },
            ),
            SizedBox(height: 20),
            RoleSelector(
              label: 'I want to Work',
              onTap: () {
                Navigator.pushNamed(context, '/freelancerDashboard');
              },
            ),
          ],
        ),
      ),
    );
  }
}