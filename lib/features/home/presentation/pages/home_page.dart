import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherly/domain/entities/weather.dart';
import 'package:weatherly/features/forecast/presentation/pages/forecast_page.dart';
import 'package:weatherly/features/map/presentation/pages/map_page.dart';
import 'package:weatherly/features/favorites/presentation/pages/favorites_page.dart';
import 'package:weatherly/features/settings/presentation/pages/settings_page.dart';
import 'package:weatherly/features/home/presentation/widgets/current_weather_card.dart';
import 'package:weatherly/features/home/presentation/widgets/weather_details_card.dart';
import 'package:weatherly/features/search/presentation/pages/search_page.dart';
import 'package:weatherly/core/localization/app_localizations.dart';
import 'package:weatherly/core/widgets/weather_background.dart';
import 'package:weatherly/features/home/presentation/providers/weather_provider.dart';
import 'package:weatherly/features/home/presentation/providers/alert_provider.dart';
import 'package:weatherly/features/home/presentation/widgets/weather_alert_banner.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedIndex = 0;
  Location? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final locationAsync = ref.watch(currentLocationProvider);
    
    // Initialize alert monitoring
    ref.watch(alertMonitoringProvider);

    return Scaffold(
      body: _selectedIndex == 0
          ? locationAsync.when(
              data: (location) {
                if (location == null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_off, size: 64),
                        const SizedBox(height: 16),
                        Text(l10n.locationPermissionDenied),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () {
                            ref.invalidate(currentLocationProvider);
                          },
                          icon: const Icon(Icons.refresh),
                          label: Text(l10n.retry),
                        ),
                      ],
                    ),
                  );
                }

                _selectedLocation ??= location;
                return _buildWeatherContent(_selectedLocation!);
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text('Error: $error'),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        ref.invalidate(currentLocationProvider);
                      },
                      icon: const Icon(Icons.refresh),
                      label: Text(l10n.retry),
                    ),
                  ],
                ),
              ),
            )
          : _getPageForIndex(_selectedIndex),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: l10n.home,
          ),
          NavigationDestination(
            icon: const Icon(Icons.calendar_today_outlined),
            selectedIcon: const Icon(Icons.calendar_today),
            label: l10n.forecast,
          ),
          NavigationDestination(
            icon: const Icon(Icons.map_outlined),
            selectedIcon: const Icon(Icons.map),
            label: l10n.map,
          ),
          NavigationDestination(
            icon: const Icon(Icons.favorite_outline),
            selectedIcon: const Icon(Icons.favorite),
            label: l10n.favorites,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: l10n.settings,
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherContent(Location location) {
    final l10n = AppLocalizations.of(context)!;
    final weatherAsync = ref.watch(currentWeatherProvider(location));

    return weatherAsync.when(
      data: (weather) {
        if (weather == null) {
          return Center(child: Text(l10n.noDataAvailable));
        }

        return WeatherBackground(
          condition: weather.condition ?? 'sunny',
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 100,
                floating: true,
                pinned: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: FlexibleSpaceBar(
                      title: Text(location.name),
                      centerTitle: true,
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchPage(currentCondition: weather.condition),
                        ),
                      );
                      if (result != null && result is Location) {
                        setState(() {
                          _selectedLocation = result;
                        });
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      ref.invalidate(currentWeatherProvider(location));
                    },
                  ),
                ],
              ),
              // Weather alerts banner
              SliverToBoxAdapter(
                child: ref.watch(weatherAlertsProvider(location)).when(
                  data: (alerts) => WeatherAlertBanner(alerts: alerts),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(24),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    CurrentWeatherCard(weather: weather),
                    const SizedBox(height: 32),
                    WeatherDetailsCard(weather: weather),
                    const SizedBox(height: 80),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error: $error'),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                ref.invalidate(currentWeatherProvider(location));
              },
              icon: const Icon(Icons.refresh),
              label: Text(l10n.retry),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPageForIndex(int index) {
    switch (index) {
      case 1:
        return ForecastPage(location: _selectedLocation);
      case 2:
        return MapPage(location: _selectedLocation);
      case 3:
        return const FavoritesPage();
      case 4:
        return const SettingsPage();
      default:
        return const Center(child: Text('Home'));
    }
  }
}
