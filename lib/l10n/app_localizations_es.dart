// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Weatherly';

  @override
  String get home => 'Inicio';

  @override
  String get forecast => 'Pronóstico';

  @override
  String get map => 'Mapa';

  @override
  String get favorites => 'Favoritos';

  @override
  String get settings => 'Configuración';

  @override
  String get currentWeather => 'Clima Actual';

  @override
  String get hourlyForecast => 'Pronóstico por Hora';

  @override
  String get dailyForecast => 'Pronóstico Diario';

  @override
  String get temperature => 'Temperatura';

  @override
  String get feelsLike => 'Sensación Térmica';

  @override
  String get humidity => 'Humedad';

  @override
  String get windSpeed => 'Velocidad del Viento';

  @override
  String get pressure => 'Presión';

  @override
  String get visibility => 'Visibilidad';

  @override
  String get uvIndex => 'Índice UV';

  @override
  String get sunrise => 'Amanecer';

  @override
  String get sunset => 'Atardecer';

  @override
  String get searchLocation => 'Buscar ubicación';

  @override
  String get addToFavorites => 'Agregar a Favoritos';

  @override
  String get removeFromFavorites => 'Eliminar de Favoritos';

  @override
  String get noDataAvailable => 'No hay datos disponibles';

  @override
  String get offlineMode => 'Modo Sin Conexión';

  @override
  String get lastUpdated => 'Última actualización';

  @override
  String get retry => 'Reintentar';

  @override
  String get locationPermissionDenied => 'Permiso de ubicación denegado';

  @override
  String get enableLocation => 'Habilitar Ubicación';

  @override
  String get networkError => 'Error de red';

  @override
  String get alerts => 'Alertas Meteorológicas';

  @override
  String get noAlerts => 'Sin alertas activas';
}
