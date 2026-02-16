class AppConstants {
  static const String appName = 'Weatherly';
  static const String weatherApiBaseUrl =
      'https://api.openweathermap.org/data/2.5';

  // Cache durations
  static const Duration weatherCacheDuration = Duration(minutes: 30);
  static const Duration forecastCacheDuration = Duration(hours: 6);

  // Network timeouts (increased for emulator/slow networks)
  static const Duration connectTimeout = Duration(seconds: 60);
  static const Duration receiveTimeout = Duration(seconds: 60);

  // Map defaults
  static const double defaultMapZoom = 10.0;

  // Weather codes
  static const Map<String, String> weatherConditions = {
    '01d': 'sunny',
    '01n': 'clear_night',
    '02d': 'partly_cloudy',
    '02n': 'partly_cloudy_night',
    '03d': 'cloudy',
    '03n': 'cloudy',
    '04d': 'overcast',
    '04n': 'overcast',
    '09d': 'rain',
    '09n': 'rain',
    '10d': 'rain',
    '10n': 'rain',
    '11d': 'thunderstorm',
    '11n': 'thunderstorm',
    '13d': 'snow',
    '13n': 'snow',
    '50d': 'fog',
    '50n': 'fog',
  };
}
