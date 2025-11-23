// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Weatherly';

  @override
  String get home => 'Home';

  @override
  String get forecast => 'Forecast';

  @override
  String get map => 'Map';

  @override
  String get favorites => 'Favorites';

  @override
  String get settings => 'Settings';

  @override
  String get currentWeather => 'Current Weather';

  @override
  String get hourlyForecast => 'Hourly Forecast';

  @override
  String get dailyForecast => 'Daily Forecast';

  @override
  String get temperature => 'Temperature';

  @override
  String get feelsLike => 'Feels Like';

  @override
  String get humidity => 'Humidity';

  @override
  String get windSpeed => 'Wind Speed';

  @override
  String get pressure => 'Pressure';

  @override
  String get visibility => 'Visibility';

  @override
  String get uvIndex => 'UV Index';

  @override
  String get sunrise => 'Sunrise';

  @override
  String get sunset => 'Sunset';

  @override
  String get searchLocation => 'Search location';

  @override
  String get addToFavorites => 'Add to Favorites';

  @override
  String get removeFromFavorites => 'Remove from Favorites';

  @override
  String get noDataAvailable => 'No data available';

  @override
  String get offlineMode => 'Offline Mode';

  @override
  String get lastUpdated => 'Last updated';

  @override
  String get retry => 'Retry';

  @override
  String get locationPermissionDenied => 'Location permission denied';

  @override
  String get enableLocation => 'Enable Location';

  @override
  String get networkError => 'Network error occurred';

  @override
  String get alerts => 'Weather Alerts';

  @override
  String get noAlerts => 'No active alerts';
}
