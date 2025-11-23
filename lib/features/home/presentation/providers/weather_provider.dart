import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherly/core/errors/app_error.dart';
import 'package:weatherly/core/providers/providers.dart';
import 'package:weatherly/domain/entities/weather.dart';

final currentLocationProvider = FutureProvider<Location?>((ref) async {
  final repository = ref.watch(locationRepositoryProvider);
  final result = await repository.getCurrentLocation();
  return result.data;
});

final currentWeatherProvider = FutureProvider.family<Weather?, Location>((
  ref,
  location,
) async {
  final repository = ref.watch(weatherRepositoryProvider);
  final result = await repository.getCurrentWeather(
    latitude: location.latitude,
    longitude: location.longitude,
  );
  if (result.error != null) {
    throw result.error!.map(
      network: (e) => e.message,
      server: (e) => e.message,
      location: (e) => e.message,
      permission: (e) => e.message,
      cache: (e) => e.message,
      unknown: (e) => e.message,
    );
  }
  return result.data;
});
