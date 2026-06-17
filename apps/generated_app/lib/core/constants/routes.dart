import 'package:flutter/material.dart';
import 'package:lance_it/features/authentication/presentation/screens/login_screen.dart';
import 'package:lance_it/features/authentication/presentation/screens/signup_screen.dart';
import 'package:lance_it/features/authentication/presentation/screens/role_selection_screen.dart';
import 'package:lance_it/features/client/presentation/screens/job_posting_screen.dart';
import 'package:lance_it/features/freelancer/presentation/screens/job_feed_screen.dart';
import 'package:lance_it/features/shared/presentation/screens/chat_screen.dart';

class Routes {
  static const String initialRoute = '/login';

  static final Map<String, WidgetBuilder> routes = {
    '/login': (context) => const LoginScreen(),
    '/signup': (context) => const SignupScreen(),
    '/role-selection': (context) => const RoleSelectionScreen(),
    '/job-posting': (context) => const JobPostingScreen(),
    '/job-feed': (context) => const JobFeedScreen(),
    '/chat': (context) => const ChatScreen(),
  };
}
