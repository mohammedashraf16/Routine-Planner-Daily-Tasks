import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/constant/app_colors.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundLightColor,
      appBarTheme: AppBarTheme(
        color: AppColors.primaryColor,
        titleTextStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
        toolbarHeight: 60,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        iconSize: 35,
        backgroundColor: AppColors.primaryColor,
        shape: StadiumBorder(
            side: BorderSide(
          width: 5,
          color: AppColors.whiteColor,
        )),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: AppColors.whiteColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          elevation: 0),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.white),
      iconTheme: IconThemeData(color: AppColors.primaryColor, size: 30),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: AppColors.blackColor
        ),
        bodyMedium: GoogleFonts.poppins(
            fontWeight: FontWeight.w600, fontSize: 20, color: Colors.grey),
        bodySmall: GoogleFonts.poppins(
            fontWeight: FontWeight.w700, fontSize: 17, color: Colors.grey),
      ));
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundDarkColor,
    appBarTheme: AppBarTheme(
      color: AppColors.primaryColor,
      titleTextStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
      toolbarHeight: 60,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      iconSize: 35,
      backgroundColor: AppColors.primaryColor,
      shape: StadiumBorder(
        side: BorderSide(
          width: 5,
          color: AppColors.blackDarkColor,
        ),
      ),
    ),
    shadowColor: Colors.white38,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: Colors.transparent,
        elevation: 0),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    iconTheme: IconThemeData(color: AppColors.primaryColor, size: 30),
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColors.blackDarkColor,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: AppColors.whiteColor
      ),
      bodyMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w600, fontSize: 20, color: Colors.grey),
      bodySmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w700, fontSize: 17, color: Colors.grey),
    ),
  );
}
