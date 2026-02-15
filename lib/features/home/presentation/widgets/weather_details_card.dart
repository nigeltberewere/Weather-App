import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weatherly/core/theme/app_colors.dart';
import 'package:weatherly/core/utils/date_formatter.dart';
import 'package:weatherly/core/utils/unit_converter.dart';
import 'package:weatherly/core/providers/settings_providers.dart';
import 'package:weatherly/domain/entities/weather.dart';
import 'package:weatherly/core/localization/app_localizations.dart';

class WeatherDetailsCard extends ConsumerWidget {
  final Weather weather;

  const WeatherDetailsCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final unitAsync = ref.watch(unitPreferenceProvider);

    return unitAsync.when(
      data: (unit) => _buildDetails(context, l10n, unit),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }

  Widget _buildDetails(BuildContext context, AppLocalizations l10n, String unit) {
    final details = [
      _WeatherDetail(
        label: l10n.humidity,
        value: '${weather.humidity}%',
        iconPath: 'assets/weather icons/fill/all/humidity.svg',
      ),
      _WeatherDetail(
        label: l10n.windSpeed,
        value: UnitConverter.formatWindSpeed(weather.windSpeed, unit),
        iconPath: 'assets/weather icons/fill/all/wind.svg',
      ),
      _WeatherDetail(
        label: l10n.pressure,
        value: '${weather.pressure} hPa',
        iconPath: 'assets/weather icons/fill/all/barometer.svg',
      ),
      _WeatherDetail(
        label: l10n.uvIndex,
        value: weather.uvIndex.toStringAsFixed(1),
        iconPath: 'assets/weather icons/fill/all/uv-index.svg',
      ),
      _WeatherDetail(
        label: l10n.visibility,
        value: UnitConverter.formatVisibility(weather.visibility, unit),
        iconPath: 'assets/weather icons/fill/all/mist.svg',
      ),
      _WeatherDetail(
        label: l10n.sunrise,
        value: DateFormatter.formatTime(weather.sunrise),
        iconPath: 'assets/weather icons/fill/all/sunrise.svg',
      ),
      _WeatherDetail(
        label: l10n.sunset,
        value: DateFormatter.formatTime(weather.sunset),
        iconPath: 'assets/weather icons/fill/all/sunset.svg',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: details.length,
      itemBuilder: (context, index) {
        final detail = details[index];
        return Container(
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.cardBorder),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(detail.iconPath, width: 32, height: 32),
              const SizedBox(height: 6),
              Flexible(
                child: Text(
                  detail.label.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 2),
              Flexible(
                child: Text(
                  detail.value,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _WeatherDetail {
  final String label;
  final String value;
  final String iconPath;

  const _WeatherDetail({
    required this.label,
    required this.value,
    required this.iconPath,
  });
}
