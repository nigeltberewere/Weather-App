// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uv_index_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UVIndexResponse _$UVIndexResponseFromJson(Map<String, dynamic> json) =>
    UVIndexResponse(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      date: (json['date'] as num).toInt(),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$UVIndexResponseToJson(UVIndexResponse instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'date': instance.date,
      'value': instance.value,
    };
