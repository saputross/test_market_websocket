import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  static Color primary = Get.isDarkMode ? const Color(0xFF1F2D7C) : const Color(0xFF1F2D7C);

  static Color primaryVariant = Get.isDarkMode ? const Color(0xFF0CC0DF) : const Color(0xFF0CC0DF);
  static Color secondary = Get.isDarkMode ? const Color(0xFFF2C949) : const Color(0xFFF2C949);
  static Color secondaryVariant = Get.isDarkMode ? const Color(0xFFEEAD3E) : const Color(0xFFEEAD3E);
  static Color tersiary = Get.isDarkMode ? Colors.red : Colors.red;
  static Color surface = Get.isDarkMode ? Colors.white : Colors.white;
  static Color background = Get.isDarkMode ? const Color(0xFF001836) : const Color.fromARGB(255, 0, 24, 54);
  static Color background2 = Get.isDarkMode ? const Color(0xFF011A3D) : const Color(0xFF011A3D);
  static Color backgroundAccent = Get.isDarkMode ? const Color(0xFF11235A) : const Color(0xFF11235A);
  static Color divider = Get.isDarkMode ? const Color(0xFFDCDCDC) : const Color(0xFFDCDCDC);
  static Color lightGrey = Get.isDarkMode ? const Color(0xFFF0F1F5) : const Color(0xFFF0F1F5);
  static Color grey = Get.isDarkMode ? const Color(0xFF858585) : const Color(0xFF858585);
  static Color error = Get.isDarkMode ? const Color(0xFFEF4444) : const Color(0xFFEF4444);
  static Color onPrimary = Get.isDarkMode ? Colors.white : Colors.white;
  static Color onSecondary = Get.isDarkMode ? Colors.white : Colors.white;
  static Color onSecondaryVariant = Get.isDarkMode ? Colors.black : Colors.black;
  static Color onSurface = Get.isDarkMode ? const Color(0xFF3C4043) : const Color(0xFF3C4043);
  static Color onBackground = Get.isDarkMode ? Colors.black : Colors.black;
  static Color onError = Get.isDarkMode ? Colors.white : Colors.white;
  static Color green = Get.isDarkMode ? const Color(0xFFC5EEBE) : const Color(0xFFC5EEBE);
  static Color darkGreen = Get.isDarkMode ? const Color(0xFF279015) : const Color(0xFF279015);
  static Color blue = Get.isDarkMode ? const Color(0xFF7CA8FF) : const Color(0xFF7CA8FF);
  static Color darkBlue = Get.isDarkMode ? const Color(0xFF001D3D) : const Color(0xFF001D3D);
  static Color red = Get.isDarkMode ? const Color(0xFFEEBEBE) : const Color(0xFFEEBEBE);
  static Color darkRed = Get.isDarkMode ? const Color(0xFFCA3636) : const Color(0xFFCA3636);
  static Color purple = const Color.fromARGB(255, 225, 190, 231);
  static Color darkPurple = const Color.fromARGB(255, 118, 0, 139);
  static Color white = Get.isDarkMode ? Colors.white : Colors.white;
  static Color royalBlue = Get.isDarkMode ? const Color(0xFF0068D6) : const Color(0xFF0068D6);

  static Color neutral_10 = Get.isDarkMode ? const Color(0xFFFAFCFC) : const Color(0xFFFAFCFC);
  static Color neutral_20 = Get.isDarkMode ? const Color(0xFFE4E8EE) : const Color(0xFFE4E8EE);
  static Color neutral_30 = Get.isDarkMode ? const Color(0xFFC1C9D0) : const Color(0xFFC1C9D0);
  static Color neutral_40 = Get.isDarkMode ? const Color(0xFFA2ABB7) : const Color(0xFFA2ABB7);
  static Color neutral_50 = Get.isDarkMode ? const Color(0xFF8892A2) : const Color(0xFF8892A2);
  static Color neutral_60 = Get.isDarkMode ? const Color(0xFF6B7385) : const Color(0xFF6B7385);
  static Color neutral_70 = Get.isDarkMode ? const Color(0xFF505669) : const Color(0xFF505669);
  static Color neutral_80 = Get.isDarkMode ? const Color(0xFF3C4055) : const Color(0xFF3C4055);
  static Color neutral_90 = Get.isDarkMode ? const Color(0xFF2C2B44) : const Color(0xFF2C2B44);

  static Color primary_10 = Get.isDarkMode ? const Color(0xFFCCEED0) : const Color(0xFFCCEED0);
  static Color primary_20 = Get.isDarkMode ? const Color(0xFFAAE3B1) : const Color(0xFFAAE3B1);
  static Color primary_30 = Get.isDarkMode ? const Color(0xFF80D58A) : const Color(0xFF80D58A);
  static Color primary_40 = Get.isDarkMode ? const Color(0xFF55C864) : const Color(0xFF55C864);
  static Color primary_50 = Get.isDarkMode ? const Color(0xFF2BBA3D) : const Color(0xFF2BBA3D);
  static Color primary_60 = Get.isDarkMode ? const Color(0xFFE1464A) : const Color(0xFFE1464A);
  static Color primary_80 = Get.isDarkMode ? const Color(0xFF008F12) : const Color(0xFF008F12);
  static Color primary_90 = Get.isDarkMode ? const Color(0xFF00730F) : const Color(0xFF00730F);

  static Color warning_10 = Get.isDarkMode ? const Color(0xFFFDF5E6) : const Color(0xFFFDF5E6);
  static Color warning_20 = Get.isDarkMode ? const Color(0xFFFBE5BC) : const Color(0xFFFBE5BC);
  static Color warning_30 = Get.isDarkMode ? const Color(0xFFF8D89A) : const Color(0xFFF8D89A);
  static Color warning_40 = Get.isDarkMode ? const Color(0xFFF2B235) : const Color(0xFFF2B235);
  static Color warning_50 = Get.isDarkMode ? const Color(0xFFF6AA12) : const Color(0xFFF6AA12);

  static Color success_10 = Get.isDarkMode ? const Color(0xFFF2FEEE) : const Color(0xFFF2FEEE);
  static Color success_20 = Get.isDarkMode ? const Color(0xFFCFF7C9) : const Color(0xFFCFF7C9);
  static Color success_30 = Get.isDarkMode ? const Color(0xFF91E396) : const Color(0xFF91E396);
  static Color success_40 = Get.isDarkMode ? const Color(0xFF3EB574) : const Color(0xFF3EB574);
  static Color success_50 = Get.isDarkMode ? const Color(0xFF198754) : const Color(0xFF198754);

  static Color error_10 = Get.isDarkMode ? const Color(0xFFFEF7F4) : const Color(0xFFFEF7F4);
  static Color error_20 = Get.isDarkMode ? const Color(0xFFF2AFB3) : const Color(0xFFF2AFB3);
  static Color error_30 = Get.isDarkMode ? const Color(0xFFF099A7) : const Color(0xFFF099A7);
  static Color error_40 = Get.isDarkMode ? const Color(0xFFBC3263) : const Color(0xFFBC3263);
}
