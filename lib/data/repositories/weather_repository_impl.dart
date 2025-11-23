import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weatherly/core/errors/app_error.dart';
import 'package:weatherly/data/datasources/weather_api_client.dart';
import 'package:weatherly/data/models/open_weather_map_response.dart';
import 'package:weatherly/domain/entities/weather.dart';
import 'package:weatherly/domain/repositories/weather_repository.dart';
import 'package:collection/collection.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiClient _apiClient;
  final String _apiKey;

  WeatherRepositoryImpl(this._apiClient)
    : _apiKey = dotenv.env['WEATHER_API_KEY'] ?? 'demo_key_for_testing';

  @override
  Future<({Weather? data, AppError? error})> getCurrentWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _apiClient.getCurrentWeather(
        lat: latitude,
        lon: longitude,
        apiKey: _apiKey,
      );

      final weather = Weather(
        temperature: response.main.temp,
        feelsLike: response.main.feelsLike,
        description: response.weather.first.description,
        icon: _getIconUrl(response.weather.first.icon),
        humidity: response.main.humidity,
        windSpeed: response.wind.speed * 3.6, // m/s to km/h
        windDegree: response.wind.deg,
        pressure: response.main.pressure,
        visibility: (response.visibility / 1000).round(), // meters to km
        dewPoint: 0.0, // Not provided in standard current weather
        uvIndex: 0, // Not provided in standard current weather
        sunrise: DateTime.fromMillisecondsSinceEpoch(
          response.sys.sunrise! * 1000,
        ),
        sunset: DateTime.fromMillisecondsSinceEpoch(
          response.sys.sunset! * 1000,
        ),
        timestamp: DateTime.fromMillisecondsSinceEpoch(response.dt * 1000),
        condition: _mapConditionCode(
          response.weather.first.id,
          icon: response.weather.first.icon,
        ),
      );

      return (data: weather, error: null);
    } on DioException catch (e) {
      return (data: null, error: _handleDioError(e));
    } catch (e) {
      return (data: null, error: AppError.unknown(e.toString()));
    }
  }

  @override
  Future<({List<HourlyForecast>? data, AppError? error})> getHourlyForecast({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _apiClient.getForecast(
        lat: latitude,
        lon: longitude,
        apiKey: _apiKey,
      );

      final hourlyForecasts = response.list.take(16).map((item) {
        // 16 items * 3 hours = 48 hours
        return HourlyForecast(
          time: DateTime.fromMillisecondsSinceEpoch(item.dt * 1000),
          temperature: item.main.temp,
          feelsLike: item.main.feelsLike,
          precipitationProbability: (item.pop * 100).round(),
          windSpeed: item.wind.speed * 3.6,
          description: item.weather.first.description,
          icon: _getIconUrl(item.weather.first.icon),
          condition: _mapConditionCode(
            item.weather.first.id,
            icon: item.weather.first.icon,
          ),
          precipitationAmount:
              0.0, // Not easily available in standard forecast list
        );
      }).toList();

      return (data: hourlyForecasts, error: null);
    } on DioException catch (e) {
      return (data: null, error: _handleDioError(e));
    } catch (e) {
      return (data: null, error: AppError.unknown(e.toString()));
    }
  }

  @override
  Future<({List<DailyForecast>? data, AppError? error})> getDailyForecast({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _apiClient.getForecast(
        lat: latitude,
        lon: longitude,
        apiKey: _apiKey,
      );

      // Group by day
      final grouped = groupBy(response.list, (ForecastItem item) {
        final date = DateTime.fromMillisecondsSinceEpoch(item.dt * 1000);
        return DateTime(date.year, date.month, date.day);
      });

      final dailyForecasts = <DailyForecast>[];

      grouped.forEach((date, items) {
        if (dailyForecasts.length >= 7) return;

        final tempMax = items
            .map((e) => e.main.tempMax)
            .reduce((a, b) => a > b ? a : b);
        final tempMin = items
            .map((e) => e.main.tempMin)
            .reduce((a, b) => a < b ? a : b);
        final maxWind =
            items.map((e) => e.wind.speed).reduce((a, b) => a > b ? a : b) *
            3.6;
        final avgHumidity = items.map((e) => e.main.humidity).average.round();
        final maxPop = items.map((e) => e.pop).reduce((a, b) => a > b ? a : b);

        // Pick the weather condition from the middle of the day (around noon)
        // or the first item if noon is not available
        final noonItem = items.firstWhere(
          (e) {
            final t = DateTime.fromMillisecondsSinceEpoch(e.dt * 1000);
            return t.hour >= 11 && t.hour <= 14;
          },
          orElse: () => items.length > items.length ~/ 2
              ? items[items.length ~/ 2]
              : items.first,
        );

        dailyForecasts.add(
          DailyForecast(
            date: date,
            tempMax: tempMax,
            tempMin: tempMin,
            description: noonItem.weather.first.description,
            icon: _getIconUrl(noonItem.weather.first.icon),
            condition: _mapConditionCode(
              noonItem.weather.first.id,
              icon: noonItem.weather.first.icon,
            ),
            precipitationProbability: (maxPop * 100).round(),
            windSpeed: maxWind,
            humidity: avgHumidity,
          ),
        );
      });

      return (data: dailyForecasts, error: null);
    } on DioException catch (e) {
      return (data: null, error: _handleDioError(e));
    } catch (e) {
      return (data: null, error: AppError.unknown(e.toString()));
    }
  }

  String _getIconUrl(String iconCode) {
    return 'https://openweathermap.org/img/wn/$iconCode@2x.png';
  }

  String _mapConditionCode(int code, {String? icon}) {
    // https://openweathermap.org/weather-conditions
    final isNight = icon?.endsWith('n') ?? false;

    if (code == 800) return isNight ? 'clear_night' : 'sunny';

    // Clouds
    if (code == 801) return isNight ? 'partly_cloudy_night' : 'partly_cloudy';
    if (code == 802) return 'cloudy'; // Scattered clouds
    if (code == 803 || code == 804) return 'overcast'; // Broken/Overcast clouds

    // Rain
    if (code >= 500 && code < 600) return 'rain';

    // Drizzle
    if (code >= 300 && code < 400) return 'drizzle';

    // Thunderstorm
    if (code >= 200 && code < 300) return 'thunderstorm';

    // Snow
    if (code >= 600 && code < 700) return 'snow';

    // Atmosphere
    if (code >= 700 && code < 800) {
      if (code == 701) return 'mist';
      if (code == 741) return 'fog';
      if (code == 721) return 'haze';
      if (code == 761 || code == 731 || code == 751) return 'dust';
      return 'fog'; // Default for others like smoke, sand, ash, squall, tornado
    }

    return isNight ? 'clear_night' : 'sunny'; // Default
  }

  @override
  Future<({List<WeatherAlert>? data, AppError? error})> getWeatherAlerts({
    required double latitude,
    required double longitude,
  }) async {
    return (data: <WeatherAlert>[], error: null);
  }

  AppError _handleDioError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return const AppError.network('Connection timeout');
    } else if (error.type == DioExceptionType.connectionError) {
      return const AppError.network('No internet connection');
    } else if (error.response != null) {
      return AppError.server('Server error: ${error.response?.statusCode}');
    }
    return AppError.unknown(error.message ?? 'Unknown error');
  }
}
