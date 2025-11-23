import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:weatherly/domain/entities/weather.dart';

class MapPage extends StatefulWidget {
  final Location? location;

  const MapPage({super.key, this.location});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String? _rainViewerUrlTemplate;
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    _fetchRainViewerConfig();
  }

  Future<void> _fetchRainViewerConfig() async {
    try {
      final response = await _dio.get(
        'https://api.rainviewer.com/public/weather-maps.json',
      );
      final data = response.data;
      final host = data['host'];
      final radar = data['radar'];
      final past = radar['past'] as List;

      if (past.isNotEmpty) {
        final latest = past.last;
        final path = latest['path'];
        // Construct URL template: {host}{path}/256/{z}/{x}/{y}/2/1_1.png
        // 2 = Blue color scheme, 1_1 = Smooth + Snow mask
        setState(() {
          _rainViewerUrlTemplate = '$host$path/256/{z}/{x}/{y}/2/1_1.png';
        });
      }
    } catch (e) {
      debugPrint('Error fetching RainViewer config: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.location == null) {
      return const Center(
        child: Text('Please select a location to view on map'),
      );
    }

    final initialPosition = LatLng(
      widget.location!.latitude,
      widget.location!.longitude,
    );

    return Scaffold(
      appBar: AppBar(title: Text('Map - ${widget.location!.name}')),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: initialPosition,
              initialZoom: 8.0, // Zoom out a bit to see more radar
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c', 'd'],
                userAgentPackageName: 'com.yourorg.weatherly',
              ),
              if (_rainViewerUrlTemplate != null)
                TileLayer(
                  urlTemplate: _rainViewerUrlTemplate!,
                  userAgentPackageName: 'com.yourorg.weatherly',
                ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: initialPosition,
                    width: 80,
                    height: 80,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (_rainViewerUrlTemplate == null)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
