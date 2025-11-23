import 'package:json_annotation/json_annotation.dart';

part 'weather_api_location.g.dart';

@JsonSerializable()
class WeatherApiLocation {
  final int? id;
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String? url;

  WeatherApiLocation({
    this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    this.url,
  });

  factory WeatherApiLocation.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiLocationFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherApiLocationToJson(this);
}
