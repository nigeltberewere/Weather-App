# API Integration Guide

## Current Implementation: OpenWeatherMap

### Endpoints Used

1. **Current Weather**
   - Endpoint: `/weather`
   - Parameters: `lat`, `lon`, `appid`, `units`
   - Returns: Current weather conditions

2. **Hourly Forecast**
   - Endpoint: `/forecast`
   - Parameters: `lat`, `lon`, `appid`, `units`
   - Returns: 5-day forecast in 3-hour steps

3. **Daily Forecast**
   - Derived from hourly forecast by grouping

### Data Mapping

#### Weather Entity
```dart
Weather(
  temperature: main.temp,
  feelsLike: main.feels_like,
  description: weather[0].description,
  icon: weather[0].icon,
  humidity: main.humidity,
  windSpeed: wind.speed,
  windDegree: wind.deg,
  pressure: main.pressure,
  visibility: visibility,
  dewPoint: calculated,
  uvIndex: from OneCall API,
  sunrise: sys.sunrise,
  sunset: sys.sunset,
)
```

## Adding a New Weather Provider

### Step 1: Create API Client

Create a new file `lib/data/datasources/new_provider_api_client.dart`:

```dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'new_provider_api_client.g.dart';

@RestApi()
abstract class NewProviderApiClient {
  factory NewProviderApiClient(Dio dio, {String baseUrl}) = _NewProviderApiClient;

  @GET('/endpoint')
  Future<Map<String, dynamic>> getCurrentWeather({
    @Query('lat') required double lat,
    @Query('lon') required double lon,
    @Query('key') required String apiKey,
  });
  
  // Add other endpoints
}
```

### Step 2: Create Repository Implementation

Create `lib/data/repositories/new_provider_weather_repository_impl.dart`:

```dart
import 'package:weatherly/domain/repositories/weather_repository.dart';
import 'package:weatherly/domain/entities/weather.dart';
import 'package:weatherly/core/errors/app_error.dart';
import 'package:weatherly/data/datasources/new_provider_api_client.dart';

class NewProviderWeatherRepositoryImpl implements WeatherRepository {
  final NewProviderApiClient _apiClient;
  final String _apiKey;

  NewProviderWeatherRepositoryImpl(this._apiClient, this._apiKey);

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

      // Map response to Weather entity
      final weather = Weather(
        temperature: response['temp'],
        // ... map other fields
      );

      return (data: weather, error: null);
    } catch (e) {
      return (data: null, error: AppError.unknown(e.toString()));
    }
  }

  // Implement other methods
}
```

### Step 3: Update Providers

Update `lib/core/providers/providers.dart`:

```dart
// Add new provider option
enum WeatherProvider { openWeatherMap, newProvider }

final selectedWeatherProviderProvider = StateProvider<WeatherProvider>(
  (ref) => WeatherProvider.openWeatherMap,
);

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final selectedProvider = ref.watch(selectedWeatherProviderProvider);
  
  switch (selectedProvider) {
    case WeatherProvider.openWeatherMap:
      final apiClient = ref.watch(weatherApiClientProvider);
      return WeatherRepositoryImpl(apiClient);
    case WeatherProvider.newProvider:
      final dio = ref.watch(dioProvider);
      final apiClient = NewProviderApiClient(dio, baseUrl: 'https://api.newprovider.com');
      return NewProviderWeatherRepositoryImpl(apiClient, dotenv.env['NEW_PROVIDER_API_KEY']!);
  }
});
```

### Step 4: Update Environment Configuration

Add to `.env`:
```
NEW_PROVIDER_API_KEY=your_key_here
```

Add to `.env.example`:
```
# New Provider Configuration
NEW_PROVIDER_API_KEY=your_new_provider_api_key_here
```

### Step 5: Run Code Generation

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Step 6: Add Configuration UI

In Settings page, add provider selection:

```dart
ListTile(
  title: Text('Weather Provider'),
  subtitle: Text('OpenWeatherMap'),
  onTap: () {
    // Show dialog to select provider
  },
)
```

## Supported Weather Providers

### 1. OpenWeatherMap (Current)
- **Website**: https://openweathermap.org
- **Free Tier**: 60 calls/minute, 1,000,000 calls/month
- **Features**: Current weather, forecasts, historical
- **API Key**: Required

### 2. WeatherAPI.com
- **Website**: https://www.weatherapi.com
- **Free Tier**: 1,000,000 calls/month
- **Features**: Current, forecast, astronomy, alerts
- **Implementation**: Follow steps above

### 3. Visual Crossing Weather
- **Website**: https://www.visualcrossing.com
- **Free Tier**: 1000 records/day
- **Features**: Historical, forecast, weather insights
- **Implementation**: Follow steps above

### 4. Tomorrow.io (formerly ClimaCell)
- **Website**: https://www.tomorrow.io
- **Free Tier**: 500 calls/day, 3 calls/hour
- **Features**: Hyperlocal forecasts, nowcasting
- **Implementation**: Follow steps above

## Data Normalization

Regardless of provider, map all responses to standard entities:

### Weather Entity Fields
```dart
class Weather {
  required double temperature;        // °C
  required double feelsLike;          // °C
  required String description;        // e.g., "Partly cloudy"
  required String icon;               // Provider-specific code
  required int humidity;              // %
  required double windSpeed;          // m/s
  required int windDegree;            // degrees
  required int pressure;              // hPa
  required int visibility;            // meters
  required double dewPoint;           // °C
  required int uvIndex;               // 0-11+
  required DateTime sunrise;
  required DateTime sunset;
  required DateTime timestamp;
  String? condition;                  // Internal: sunny, rain, etc.
}
```

### Conversion Guidelines

- **Temperature**: Convert to Celsius if in Fahrenheit
- **Wind Speed**: Convert to m/s if in different unit
- **Pressure**: Convert to hPa (millibars)
- **Visibility**: Convert to meters
- **Time**: Convert to DateTime (UTC or local)

## Error Handling

Handle provider-specific errors:

```dart
AppError _handleProviderError(dynamic error) {
  if (error is DioException) {
    if (error.response?.statusCode == 401) {
      return AppError.server('Invalid API key');
    } else if (error.response?.statusCode == 429) {
      return AppError.server('Rate limit exceeded');
    }
  }
  return AppError.unknown(error.toString());
}
```

## Testing with Mock Data

Create mock response files:

```
test/fixtures/
├── openweather_current.json
├── openweather_forecast.json
├── newprovider_current.json
└── newprovider_forecast.json
```

Use in tests:

```dart
test('parses OpenWeatherMap response correctly', () {
  final json = jsonDecode(fixture('openweather_current.json'));
  final weather = Weather.fromOpenWeatherMapJson(json);
  expect(weather.temperature, 22.5);
});
```

## Best Practices

1. **Abstraction**: Always use repository interfaces
2. **Normalization**: Map all providers to same entities
3. **Error Handling**: Handle provider-specific errors
4. **Rate Limiting**: Implement caching and throttling
5. **Fallback**: Consider supporting multiple providers
6. **Configuration**: Make provider switchable via settings
7. **Documentation**: Document API quirks and limitations
8. **Testing**: Test with real and mock data

## Rate Limiting

Implement caching to respect API limits:

```dart
class CachedWeatherRepository implements WeatherRepository {
  final WeatherRepository _repository;
  final Map<String, ({Weather data, DateTime timestamp})> _cache = {};

  @override
  Future<({Weather? data, AppError? error})> getCurrentWeather({
    required double latitude,
    required double longitude,
  }) async {
    final key = '$latitude,$longitude';
    final cached = _cache[key];
    
    if (cached != null && 
        DateTime.now().difference(cached.timestamp) < Duration(minutes: 10)) {
      return (data: cached.data, error: null);
    }

    final result = await _repository.getCurrentWeather(
      latitude: latitude,
      longitude: longitude,
    );

    if (result.data != null) {
      _cache[key] = (data: result.data!, timestamp: DateTime.now());
    }

    return result;
  }
}
```

## Migration Guide

When switching providers:

1. Update `.env` with new API key
2. Change provider in settings or code
3. Clear cache to force data refresh
4. Test thoroughly with new provider
5. Update documentation

---

For questions or issues with API integration, refer to:
- Provider documentation
- `lib/data/repositories/` implementations
- API provider support channels
