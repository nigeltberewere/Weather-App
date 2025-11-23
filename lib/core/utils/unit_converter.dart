class UnitConverter {
  static double celsiusToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }

  static double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }

  static double kmhToMph(double kmh) {
    return kmh * 0.621371;
  }

  static double kmToMiles(double km) {
    return km * 0.621371;
  }

  static String formatTemperature(double temp, String unit) {
    switch (unit) {
      case 'metric':
        return '${temp.round()}°C';
      case 'imperial':
        return '${celsiusToFahrenheit(temp).round()}°F';
      case 'kelvin':
        return '${(temp + 273.15).round()}K';
      default:
        return '${temp.round()}°C';
    }
  }

  static String formatWindSpeed(double speedKmh, String unit) {
    switch (unit) {
      case 'metric':
        return '${speedKmh.round()} km/h';
      case 'imperial':
        return '${kmhToMph(speedKmh).round()} mph';
      default:
        return '${speedKmh.round()} km/h';
    }
  }

  static String formatVisibility(num visibilityKm, String unit) {
    if (unit == 'imperial') {
      return '${kmToMiles(visibilityKm.toDouble()).toStringAsFixed(1)} mi';
    }
    return '${visibilityKm.toStringAsFixed(1)} km';
  }
}
