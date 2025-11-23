import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherly/app.dart';
import 'package:weatherly/core/localization/app_localizations.dart';
import 'package:weatherly/core/widgets/app_icon.dart';

final unitPreferenceProvider = NotifierProvider<UnitPreferenceNotifier, String>(
  UnitPreferenceNotifier.new,
);
final iconStylePreferenceProvider =
    NotifierProvider<IconStylePreferenceNotifier, String>(
      IconStylePreferenceNotifier.new,
    );

class UnitPreferenceNotifier extends Notifier<String> {
  @override
  String build() => 'metric';

  void set(String unit) => state = unit;
}

class IconStylePreferenceNotifier extends Notifier<String> {
  @override
  String build() => 'fill';

  void set(String style) => state = style;
}

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final themeMode = ref.watch(themeModeProvider);
    final unitPreference = ref.watch(unitPreferenceProvider);
    final iconStyle = ref.watch(iconStylePreferenceProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: const Text('Theme'),
            subtitle: Text(_getThemeModeLabel(themeMode)),
            onTap: () {
              _showThemeDialog(context, ref);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.image_outlined),
            title: const Text('Icon Style'),
            subtitle: Text(_getIconStyleLabel(iconStyle)),
            onTap: () {
              _showIconStyleDialog(context, ref);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.thermostat_outlined),
            title: const Text('Temperature Unit'),
            subtitle: Text(_getUnitLabel(unitPreference)),
            onTap: () {
              _showUnitDialog(context, ref);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Notifications'),
            subtitle: const Text('Manage weather alerts'),
            onTap: () {
              // Navigate to notifications settings
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text('Location'),
            subtitle: const Text('Manage location permissions'),
            onTap: () {
              // Navigate to location settings
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy'),
            subtitle: const Text('Privacy policy and data usage'),
            onTap: () {
              // Show privacy policy
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outlined),
            title: const Text('About'),
            subtitle: const Text('Version 1.0.0'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Weatherly',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2025 Weatherly',
                applicationIcon: const AppIcon(size: 48),
              );
            },
          ),
        ],
      ),
    );
  }

  String _getThemeModeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }

  String _getUnitLabel(String unit) {
    switch (unit) {
      case 'metric':
        return 'Celsius (°C)';
      case 'imperial':
        return 'Fahrenheit (°F)';
      case 'kelvin':
        return 'Kelvin (K)';
      default:
        return 'Celsius (°C)';
    }
  }

  String _getIconStyleLabel(String style) {
    switch (style) {
      case 'fill':
        return 'Filled';
      case 'line':
        return 'Line';
      default:
        return 'Filled';
    }
  }

  void _showThemeDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Theme'),
        content: StatefulBuilder(
          builder: (context, setState) {
            final currentTheme = ref.watch(themeModeProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Light'),
                  leading: Radio<ThemeMode>(
                    value: ThemeMode.light,
                    groupValue: currentTheme,
                    onChanged: (value) {
                      if (value != null) {
                        ref.read(themeModeProvider.notifier).set(value);
                        Navigator.pop(context);
                      }
                    },
                  ),
                  onTap: () {
                    ref.read(themeModeProvider.notifier).set(ThemeMode.light);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Dark'),
                  leading: Radio<ThemeMode>(
                    value: ThemeMode.dark,
                    groupValue: currentTheme,
                    onChanged: (value) {
                      if (value != null) {
                        ref.read(themeModeProvider.notifier).set(value);
                        Navigator.pop(context);
                      }
                    },
                  ),
                  onTap: () {
                    ref.read(themeModeProvider.notifier).set(ThemeMode.dark);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('System'),
                  leading: Radio<ThemeMode>(
                    value: ThemeMode.system,
                    groupValue: currentTheme,
                    onChanged: (value) {
                      if (value != null) {
                        ref.read(themeModeProvider.notifier).set(value);
                        Navigator.pop(context);
                      }
                    },
                  ),
                  onTap: () {
                    ref.read(themeModeProvider.notifier).set(ThemeMode.system);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showUnitDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Temperature Unit'),
        content: StatefulBuilder(
          builder: (context, setState) {
            final currentUnit = ref.watch(unitPreferenceProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Celsius (°C)'),
                  leading: Radio<String>(
                    value: 'metric',
                    groupValue: currentUnit,
                    onChanged: (value) {
                      if (value != null) {
                        ref.read(unitPreferenceProvider.notifier).set(value);
                        Navigator.pop(context);
                      }
                    },
                  ),
                  onTap: () {
                    ref.read(unitPreferenceProvider.notifier).set('metric');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Fahrenheit (°F)'),
                  leading: Radio<String>(
                    value: 'imperial',
                    groupValue: currentUnit,
                    onChanged: (value) {
                      if (value != null) {
                        ref.read(unitPreferenceProvider.notifier).set(value);
                        Navigator.pop(context);
                      }
                    },
                  ),
                  onTap: () {
                    ref.read(unitPreferenceProvider.notifier).set('imperial');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Kelvin (K)'),
                  leading: Radio<String>(
                    value: 'kelvin',
                    groupValue: currentUnit,
                    onChanged: (value) {
                      if (value != null) {
                        ref.read(unitPreferenceProvider.notifier).set(value);
                        Navigator.pop(context);
                      }
                    },
                  ),
                  onTap: () {
                    ref.read(unitPreferenceProvider.notifier).set('kelvin');
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showIconStyleDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Icon Style'),
        content: StatefulBuilder(
          builder: (context, setState) {
            final currentStyle = ref.watch(iconStylePreferenceProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Filled'),
                  leading: Radio<String>(
                    value: 'fill',
                    groupValue: currentStyle,
                    onChanged: (value) {
                      if (value != null) {
                        ref
                            .read(iconStylePreferenceProvider.notifier)
                            .set(value);
                        Navigator.pop(context);
                      }
                    },
                  ),
                  onTap: () {
                    ref.read(iconStylePreferenceProvider.notifier).set('fill');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Line'),
                  leading: Radio<String>(
                    value: 'line',
                    groupValue: currentStyle,
                    onChanged: (value) {
                      if (value != null) {
                        ref
                            .read(iconStylePreferenceProvider.notifier)
                            .set(value);
                        Navigator.pop(context);
                      }
                    },
                  ),
                  onTap: () {
                    ref.read(iconStylePreferenceProvider.notifier).set('line');
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
