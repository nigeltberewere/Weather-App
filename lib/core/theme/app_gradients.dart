import 'package:flutter/material.dart';
import 'package:weatherly/core/theme/app_colors.dart';

class AppGradients {
  static const LinearGradient sunny = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.sunnyTop, AppColors.sunnyBottom],
  );

  static const LinearGradient night = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.nightTop, AppColors.nightBottom],
  );

  static const LinearGradient cloudy = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.cloudyTop, AppColors.cloudyBottom],
  );

  static const LinearGradient rain = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.rainTop, AppColors.rainBottom],
  );

  static const LinearGradient snow = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.snowTop, AppColors.snowBottom],
  );

  static const LinearGradient storm = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.stormTop, AppColors.stormBottom],
  );

  static LinearGradient getGradient(String condition) {
    switch (condition.toLowerCase()) {
      case 'sunny':
      case 'clear':
        return sunny;
      case 'clear_night':
        return night;
      case 'partly_cloudy':
      case 'partly_cloudy_night':
      case 'cloudy':
      case 'overcast':
      case 'mist':
      case 'fog':
      case 'haze':
      case 'dust':
        return cloudy;
      case 'rain':
      case 'drizzle':
        return rain;
      case 'snow':
        return snow;
      case 'thunderstorm':
        return storm;
      default:
        return sunny;
    }
  }
}
