# Architecture Overview

## Clean Architecture

Weatherly follows Clean Architecture principles to ensure maintainability, testability, and scalability.

### Layers

```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│  (UI, Widgets, State Management)        │
└──────────────┬──────────────────────────┘
               │
┌──────────────▼──────────────────────────┐
│           Domain Layer                  │
│  (Entities, Repository Interfaces)      │
└──────────────┬──────────────────────────┘
               │
┌──────────────▼──────────────────────────┐
│            Data Layer                   │
│  (API, Local Storage, Implementations)  │
└─────────────────────────────────────────┘
```

### 1. Domain Layer

**Purpose**: Contains business logic and defines contracts

**Components**:
- **Entities**: Core business objects (Weather, Location, Forecast)
- **Repository Interfaces**: Define methods without implementation
- **Use Cases**: Business logic operations (optional in small apps)

**Key Files**:
- `lib/domain/entities/weather.dart`
- `lib/domain/repositories/weather_repository.dart`
- `lib/domain/repositories/location_repository.dart`

**Rules**:
- No dependencies on other layers
- Pure Dart code only
- Framework-agnostic

### 2. Data Layer

**Purpose**: Manages data sources and implements repositories

**Components**:
- **Data Sources**: API clients, local database adapters
- **Models**: Data transfer objects (DTOs)
- **Repository Implementations**: Concrete implementations of domain interfaces

**Key Files**:
- `lib/data/datasources/weather_api_client.dart`
- `lib/data/repositories/weather_repository_impl.dart`
- `lib/data/repositories/location_repository_impl.dart`

**Responsibilities**:
- API communication
- Data caching
- Error handling
- Data transformation

### 3. Presentation Layer

**Purpose**: Handles UI and user interactions

**Components**:
- **Pages**: Full-screen views
- **Widgets**: Reusable UI components
- **Providers**: State management (Riverpod)
- **View Models**: Presentation logic (integrated with Riverpod)

**Key Files**:
- `lib/features/*/presentation/pages/`
- `lib/features/*/presentation/widgets/`
- `lib/core/providers/providers.dart`

**Structure**:
```
features/
├── home/
│   └── presentation/
│       ├── pages/
│       └── widgets/
├── forecast/
│   └── presentation/
│       ├── pages/
│       └── widgets/
└── ...
```

## State Management - Riverpod

### Provider Types Used

1. **Provider**: For immutable objects and services
```dart
final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepositoryImpl(...);
});
```

2. **StateProvider**: For simple state
```dart
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
```

3. **FutureProvider**: For async operations
```dart
final currentWeatherProvider = FutureProvider.family<Weather?, Location>((ref, location) async {
  // Async logic
});
```

### Benefits

- Compile-time safety
- No BuildContext needed
- Easy testing
- Automatic disposal
- Built-in caching

## Data Flow

```
User Action
    ↓
Widget (ConsumerWidget)
    ↓
Provider (ref.watch)
    ↓
Repository
    ↓
Data Source (API/Cache)
    ↓
Transform Data
    ↓
Update UI
```

## Dependency Injection

All dependencies are provided through Riverpod providers:

```dart
// Service registration
final dioProvider = Provider<Dio>((ref) => Dio(...));
final apiClientProvider = Provider<WeatherApiClient>((ref) {
  return WeatherApiClient(ref.watch(dioProvider));
});

// Usage in widgets
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(weatherRepositoryProvider);
    // Use repository
  }
}
```

## Error Handling

Errors are handled using Freezed unions:

```dart
@freezed
class AppError with _$AppError {
  const factory AppError.network(String message) = NetworkError;
  const factory AppError.server(String message) = ServerError;
  const factory AppError.location(String message) = LocationError;
  // ...
}
```

Repositories return records with optional data and error:

```dart
Future<({Weather? data, AppError? error})> getCurrentWeather(...);
```

## Testing Strategy

### Unit Tests
- Test utilities (converters, formatters)
- Test repository logic with mocks
- Test domain entities

### Widget Tests
- Test individual widgets
- Test widget interactions
- Verify UI updates

### Integration Tests
- Test complete user flows
- Test navigation
- Test state persistence

## Code Generation

Used for:
- **Freezed**: Immutable data classes
- **JSON Serialization**: API model conversion
- **Retrofit**: Type-safe API clients
- **Riverpod**: Provider code generation (optional)

Run generation:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Navigation

Simple push navigation is used:

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => DestinationPage()),
);
```

For complex apps, consider:
- go_router
- auto_route
- flutter_modular

## Best Practices

1. **Separation of Concerns**: Each layer has a single responsibility
2. **Dependency Inversion**: Depend on abstractions, not concretions
3. **Immutability**: Use Freezed for immutable models
4. **Type Safety**: Leverage Dart's strong typing
5. **Testability**: Mock dependencies in tests
6. **Code Reusability**: Extract common widgets
7. **Performance**: Cache data, minimize rebuilds
8. **Accessibility**: Add semantic labels
9. **Error Handling**: Always handle errors gracefully
10. **Documentation**: Document public APIs

## Extending the App

### Adding a New Feature

1. Create feature directory:
```
lib/features/new_feature/
├── domain/
│   └── entities/
├── data/
│   └── repositories/
└── presentation/
    ├── pages/
    └── widgets/
```

2. Define entities and repositories in domain
3. Implement data sources and repositories in data
4. Create UI in presentation
5. Register providers
6. Add navigation

### Adding a New Weather API Provider

1. Create new API client in `lib/data/datasources/`
2. Implement repository using the new client
3. Update provider in `lib/core/providers/providers.dart`
4. Add configuration in `.env`

See `docs/API_MAPPING.md` for details.

## Performance Considerations

- Use `const` constructors where possible
- Minimize widget rebuilds with proper provider scoping
- Cache network responses
- Use pagination for large lists
- Optimize images and assets
- Profile with Flutter DevTools

## Security

- No API keys in code (use `.env`)
- HTTPS only
- Input validation
- Secure local storage
- Permission management
- Rate limiting

---

This architecture ensures the app is:
- ✅ Maintainable
- ✅ Testable
- ✅ Scalable
- ✅ Type-safe
- ✅ Performance-optimized
