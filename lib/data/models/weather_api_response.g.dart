// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherApiResponse _$WeatherApiResponseFromJson(Map<String, dynamic> json) =>
    WeatherApiResponse(
      location: json['location'] as Map<String, dynamic>?,
      current: json['current'] as Map<String, dynamic>?,
      forecast: json['forecast'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$WeatherApiResponseToJson(WeatherApiResponse instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };
