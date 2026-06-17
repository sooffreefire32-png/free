import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppStyles {
  static final TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.roboto(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
    headline2: GoogleFonts.roboto(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: AppColors.primaryColor),
    bodyText1: GoogleFonts.roboto(
        fontSize: 16.0, fontWeight: FontWeight.normal, color: AppColors.primaryColor),
    bodyText2: GoogleFonts.roboto(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: AppColors.primaryColor),
    button: GoogleFonts.roboto(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: AppColors.backgroundColor),
  );
}
