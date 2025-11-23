import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF2196F3);
  static const Color secondary = Color(0xFF03A9F4);
  static const Color accent = Color(0xFFFFC107);

  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xB3FFFFFF); // 70% white
  static const Color textTertiary = Color(0x80FFFFFF); // 50% white

  // Weather Condition Colors
  // Sunny / Clear Day
  static const Color sunnyTop = Color(0xFF56CCF2);
  static const Color sunnyBottom = Color(0xFF2F80ED);

  // Clear Night
  static const Color nightTop = Color(0xFF2C3E50);
  static const Color nightBottom = Color(0xFF4CA1AF);

  // Cloudy
  static const Color cloudyTop = Color(0xFFD7D2CC);
  static const Color cloudyBottom = Color(0xFF304352);

  // Rain
  static const Color rainTop = Color(0xFF4B79A1);
  static const Color rainBottom = Color(0xFF283E51);

  // Snow
  static const Color snowTop = Color(0xFFE6DADA);
  static const Color snowBottom = Color(0xFF274046);

  // Storm
  static const Color stormTop = Color(0xFF232526);
  static const Color stormBottom = Color(0xFF414345);

  // UI Elements
  static const Color cardBackground = Color(0x1AFFFFFF); // 10% white
  static const Color cardBorder = Color(0x33FFFFFF); // 20% white

  // Light Mode Colors
  static const Color textPrimaryLight = Color(0xFF000000);
  static const Color textSecondaryLight = Color(0xFF616161);
  static const Color cardBackgroundLight = Color(0x0D000000); // 5% black
  static const Color cardBorderLight = Color(0x1A000000); // 10% black
  static const Color scaffoldBackgroundLight = Color(0xFFF5F5F5); // Off-white
  static const Color scaffoldBackgroundDark = Color(
    0xFF121212,
  ); // Dark background

  static Color getTextColorForCondition(String condition) {
    switch (condition.toLowerCase()) {
      case 'cloudy':
      case 'overcast':
      case 'mist':
      case 'fog':
      case 'haze':
      case 'dust':
      case 'snow':
      case 'partly_cloudy':
        return textPrimaryLight; // Black text for light backgrounds
      default:
        return textPrimary; // White text for dark backgrounds
    }
  }
}
