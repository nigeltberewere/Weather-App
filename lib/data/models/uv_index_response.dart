import 'package:json_annotation/json_annotation.dart';

part 'uv_index_response.g.dart';

@JsonSerializable()
class UVIndexResponse {
  final double lat;
  final double lon;
  final int date;
  final double value;

  UVIndexResponse({
    required this.lat,
    required this.lon,
    required this.date,
    required this.value,
  });

  factory UVIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$UVIndexResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UVIndexResponseToJson(this);
}
