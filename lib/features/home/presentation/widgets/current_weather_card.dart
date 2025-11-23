import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherly/core/theme/app_colors.dart';
import 'package:weatherly/core/utils/unit_converter.dart';
import 'package:weatherly/core/widgets/weather_icon.dart';
import 'package:weatherly/domain/entities/weather.dart';
import 'package:weatherly/features/settings/presentation/pages/settings_page.dart';

class CurrentWeatherCard extends ConsumerWidget {
  final Weather weather;

  const CurrentWeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final unit = ref.watch(unitPreferenceProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WeatherIcon(condition: weather.condition, size: 180),
        const SizedBox(height: 16),
        Text(
          UnitConverter.formatTemperature(weather.temperature, unit),
          style: theme.textTheme.displayLarge?.copyWith(
            fontSize: 96,
            fontWeight: FontWeight.bold,
            height: 1.0,
          ),
        ),
        Text(
          weather.description.toUpperCase(),
          style: theme.textTheme.titleLarge?.copyWith(
            color: AppColors.textSecondary,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: Text(
            'Feels like ${UnitConverter.formatTemperature(weather.feelsLike, unit)}',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
