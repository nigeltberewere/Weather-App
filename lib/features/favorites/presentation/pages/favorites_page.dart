import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherly/core/providers/providers.dart';
import 'package:weatherly/domain/entities/weather.dart';
import 'package:weatherly/core/localization/app_localizations.dart';

final favoritesProvider = FutureProvider<List<Location>>((ref) async {
  final repository = ref.watch(locationRepositoryProvider);
  final result = await repository.getFavoriteLocations();
  return result.data ?? [];
});

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final favoritesAsync = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.favorites),
      ),
      body: favoritesAsync.when(
        data: (favorites) {
          if (favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'No favorite locations',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add locations to favorites from the search page',
                    style: TextStyle(color: Colors.grey[500]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final location = favorites[index];
              return ListTile(
                leading: const Icon(Icons.favorite, color: Colors.red),
                title: Text(location.name),
                subtitle: Text(
                  '${location.state ?? ''} ${location.country ?? ''}'.trim(),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    final repository = ref.read(locationRepositoryProvider);
                    await repository.removeFavoriteLocation(location);
                    ref.invalidate(favoritesProvider);
                  },
                ),
                onTap: () {
                  // Navigate to weather for this location
                  Navigator.pop(context, location);
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
