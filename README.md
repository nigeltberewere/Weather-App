# Weatherly ☀️🌧️

A production-ready, cross-platform Flutter weather application featuring current conditions, forecasts, interactive maps, and weather alerts.

## Features

### Core Functionality
- 🌡️ **Current Weather** - Real-time weather conditions with detailed metrics
- 📊 **Hourly Forecast** - 48-hour detailed forecast with precipitation probability
- 📅 **Daily Forecast** - 7-10 day forecast with temperature ranges
- 🗺️ **Interactive Map** - Google Maps integration with location markers
- ⭐ **Favorites** - Save and manage favorite locations
- 🔍 **Location Search** - Search by city name with autocomplete
- 📍 **Auto-location** - Automatic location detection with permission handling
- 🌍 **Internationalization** - Support for English and Spanish (easily extensible)
- 🎨 **Theme Support** - Light, Dark, and System theme modes
- 📱 **Responsive Design** - Optimized for all screen sizes
- 🔔 **Weather Alerts** - Display severe weather warnings (when available from API)

### Technical Highlights
- Clean Architecture (Domain, Data, Presentation layers)
- Riverpod state management
- Freezed for immutable data models
- Offline caching with Hive
- Type-safe API clients with Retrofit
- Comprehensive error handling
- Material 3 design system
- Accessibility support

## Prerequisites

- Flutter SDK 3.0+ (Latest stable recommended)
- Dart SDK 3.9.2+
- Android Studio / VS Code with Flutter extensions
- Android SDK (for Android builds)
- Xcode (for iOS builds, macOS only)

## Getting Started

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Configure API Keys (local only)

Create a `.env` file in the project root (copy from `.env.example`):

```bash
cp .env.example .env
```

Edit `.env` and add your API keys locally. Do NOT commit `.env` to source control — it is ignored by `.gitignore` and CI should use repository secrets instead.

```env
OPENWEATHER_API_KEY=your_openweather_api_key_here
GOOGLE_MAPS_API_KEY=your_google_maps_api_key_here
```

Get API keys from the provider consoles and inject secrets into CI (GitHub Actions) via repository secrets named `OPENWEATHER_API_KEY`, `GOOGLE_MAPS_API_KEY`, etc.

### 3. Run Code Generation

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Run the App

```bash
flutter run
```

## Architecture

The app follows Clean Architecture principles with three main layers:

- **Domain Layer** - Business logic and entities
- **Data Layer** - Data sources and repositories
- **Presentation Layer** - UI and state management

For detailed architecture documentation, see `docs/ARCHITECTURE.md`.

## Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

## Building

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release
```

## License

MIT License - See LICENSE file for details

---

Made with ❤️ using Flutter
