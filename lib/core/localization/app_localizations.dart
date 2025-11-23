import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // Getters for localized strings
  String get appTitle => 'Weatherly';
  String get home => 'Home';
  String get forecast => 'Forecast';
  String get map => 'Map';
  String get favorites => 'Favorites';
  String get settings => 'Settings';
  String get currentWeather => 'Current Weather';
  String get hourlyForecast => 'Hourly Forecast';
  String get dailyForecast => 'Daily Forecast';
  String get temperature => 'Temperature';
  String get feelsLike => 'Feels Like';
  String get humidity => 'Humidity';
  String get windSpeed => 'Wind Speed';
  String get pressure => 'Pressure';
  String get visibility => 'Visibility';
  String get uvIndex => 'UV Index';
  String get sunrise => 'Sunrise';
  String get sunset => 'Sunset';
  String get searchLocation => 'Search location';
  String get addToFavorites => 'Add to Favorites';
  String get removeFromFavorites => 'Remove from Favorites';
  String get noDataAvailable => 'No data available';
  String get offlineMode => 'Offline Mode';
  String get lastUpdated => 'Last updated';
  String get retry => 'Retry';
  String get locationPermissionDenied => 'Location permission denied';
  String get enableLocation => 'Enable Location';
  String get networkError => 'Network error occurred';
  String get alerts => 'Weather Alerts';
  String get noAlerts => 'No active alerts';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
