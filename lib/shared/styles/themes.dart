import 'package:final_project/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
          headlineLarge: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: MyColors.whiteColor),
          bodyLarge: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: MyColors.whiteColor),
          bodyMedium: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: MyColors.whiteColor)));
}
