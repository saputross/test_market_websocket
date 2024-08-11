// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_market_websocket/app/config/themes/app_colors.dart';
import '../../config/themes/app_fonts.dart';

class AppThemes {
  static const String fontFamily = AppFonts.POPPINS_REG;

  static final TextTheme textTheme = TextTheme(
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 10,
      color: AppColors.white,
    ),
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      color: AppColors.white,
    ),
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      color: AppColors.white,
    ),
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 10,
      color: AppColors.white,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      color: AppColors.white,
    ),
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      color: AppColors.white,
    ),
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      color: AppColors.white,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      color: AppColors.white,
    ),
    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      color: AppColors.white,
    ),
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      color: AppColors.white,
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      color: AppColors.white,
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      color: AppColors.white,
    ),
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      color: AppColors.white,
    ),
    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      color: AppColors.white,
    ),
    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      color: AppColors.white,
    ),
  );

  static final ThemeData theme = ThemeData(
    useMaterial3: false,
    fontFamily: fontFamily,
    scaffoldBackgroundColor: AppColors.background,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.background,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      selectedLabelStyle: TextStyle(
        fontSize: 10,
        color: AppColors.primary,
        fontWeight: FontWeight.w400,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 10,
        color: AppColors.neutral_80,
        fontWeight: FontWeight.w400,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: AppColors.secondaryVariant),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.background,
        statusBarBrightness: Brightness.dark,
      ),
      centerTitle: true,
      backgroundColor: AppColors.background,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 13,
        fontWeight: FontWeight.w700,
        wordSpacing: 1.2,
      ),
      iconTheme: IconThemeData(color: AppColors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      fillColor: AppColors.backgroundAccent,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.background,
          width: 0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.background,
          width: 0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.background,
          width: 0,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.background,
          width: 0,
        ),
      ),
      filled: true,
      hintStyle: TextStyle(
        color: AppColors.neutral_50,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        fontFamily: fontFamily,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelStyle: MaterialStateTextStyle.resolveWith(
        (Set<MaterialState> states) {
          final Color color = states.contains(MaterialState.error) ? AppColors.error : AppColors.white;
          return TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
          );
        },
      ),
      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
        (Set<MaterialState> states) {
          final Color color = states.contains(MaterialState.error) ? AppColors.error : AppColors.white;
          return TextStyle(
            color: color,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            fontFamily: fontFamily,
          );
        },
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.error,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.error,
          width: 1.5,
        ),
      ),
      errorMaxLines: 2,
      errorStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.error,
        fontSize: 10,
        fontFamily: fontFamily,
      ),
      isCollapsed: true,
      isDense: true,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.primary),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.white,
      disabledColor: Colors.grey.withOpacity(0.2),
      selectedColor: AppColors.primary_20,
      secondarySelectedColor: AppColors.primary_20,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      labelStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        color: AppColors.neutral_80,
      ),
      side: BorderSide(color: AppColors.primary_20, width: 1.5),
      secondaryLabelStyle: const TextStyle(),
      checkmarkColor: AppColors.background,
      brightness: Brightness.light,
    ),
    iconTheme: IconThemeData(color: AppColors.neutral_80),
    popupMenuTheme: const PopupMenuThemeData(color: Colors.grey),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith(
        (states) {
          if (!states.contains(MaterialState.selected)) {
            return AppColors.neutral_50;
          }
          return AppColors.primary;
        },
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith(
        (states) {
          if (!states.contains(MaterialState.selected)) {
            return AppColors.neutral_50;
          }
          return AppColors.primary;
        },
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.primary_20,
    ).copyWith(
      error: AppColors.error,
    ),
    textTheme: textTheme,
  );

  static ThemeData lightTheme() {
    return theme;
  }

  static ThemeData darkTheme() {
    return theme;
  }

  ThemeMode init() {
    return ThemeMode.light;
  }
}
