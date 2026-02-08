import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
final ThemeData appTheme = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF4A6A8A),
    background: const Color(0xFFF5F7FA),
  ),

  // Default text = Josefin Sans
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.josefinSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: GoogleFonts.josefinSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: GoogleFonts.josefinSans(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),

    // Headings = Domine
    titleLarge: GoogleFonts.domine(
      fontSize: 60,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: GoogleFonts.domine(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: GoogleFonts.domine(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),

  // App bar styling
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 1,
    titleTextStyle: GoogleFonts.domine(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  ),

  // Buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: GoogleFonts.josefinSans(
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorScheme.fromSeed(seedColor: const Color(0xFF4A6A8A)).primary,
    foregroundColor: Colors.white, // icon color
  ),

  // List tiles (great for sidebar items)
  listTileTheme: ListTileThemeData(
    textColor: Colors.white,
    iconColor: Colors.white,
    titleTextStyle: GoogleFonts.josefinSans(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
);
