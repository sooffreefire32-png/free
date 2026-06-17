import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lance_it/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:lance_it/core/widgets/custom_button.dart';
import 'package:lance_it/core/widgets/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: emailController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 16),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }

                if (state is AuthAuthenticated) {
                  Navigator.pushReplacementNamed(context, '/dashboard');
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                return CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;

                    if (email.isNotEmpty && password.isNotEmpty) {
                      context.read<AuthBloc>().add(
                            RegisterRequested(email: email, password: password),
                          );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}