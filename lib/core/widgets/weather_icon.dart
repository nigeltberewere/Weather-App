import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class WeatherIcon extends ConsumerWidget {
  final String? condition;
  final double size;

  const WeatherIcon({super.key, required this.condition, this.size = 120});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filename = _getIconFilename(condition);

    return Lottie.asset(
      'assets/animations/$filename',
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Icon(Icons.error, size: size, color: Colors.red);
      },
    );
  }

  String _getIconFilename(String? condition) {
    switch (condition?.toLowerCase()) {
      case 'sunny':
      case 'clear':
        return 'clear-day.json';
      case 'clear_night':
        return 'clear-night.json';
      case 'partly_cloudy':
        return 'partly-cloudy-day.json';
      case 'partly_cloudy_night':
        return 'partly-cloudy-night.json';
      case 'cloudy':
        return 'cloudy.json';
      case 'overcast':
        return 'overcast.json';
      case 'rain':
      case 'showers':
        return 'rain.json';
      case 'drizzle':
        return 'drizzle.json';
      case 'thunderstorm':
        return 'thunderstorm.json';
      case 'snow':
        return 'snow.json';
      case 'fog':
        return 'fog.json';
      case 'mist':
        return 'mist.json';
      case 'haze':
        return 'haze.json';
      case 'dust':
        return 'dust.json';
      default:
        return 'clear-day.json'; // Default to sunny
    }
  }
}
