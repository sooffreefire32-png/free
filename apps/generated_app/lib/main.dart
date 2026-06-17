import 'package:flutter/material.dart';
import 'package:lance_it/core/constants/routes.dart';
import 'package:lance_it/core/constants/colors.dart';
import 'package:lance_it/core/constants/styles.dart';

default void main() {
  runApp(const LanceItApp());
}

class LanceItApp extends StatelessWidget {
  const LanceItApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lance-It',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: AppStyles.textTheme,
      ),
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
    );
  }
}