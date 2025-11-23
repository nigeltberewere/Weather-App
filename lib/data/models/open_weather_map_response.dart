import 'package:json_annotation/json_annotation.dart';

part 'open_weather_map_response.g.dart';

@JsonSerializable()
class OpenWeatherCurrentResponse {
  final Coord coord;
  final List<WeatherInfo> weather;
  final String base;
  final MainInfo main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  OpenWeatherCurrentResponse({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory OpenWeatherCurrentResponse.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherCurrentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OpenWeatherCurrentResponseToJson(this);
}

@JsonSerializable()
class OpenWeatherForecastResponse {
  final String cod;
  final int message;
  final int cnt;
  final List<ForecastItem> list;
  final City city;

  OpenWeatherForecastResponse({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory OpenWeatherForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherForecastResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OpenWeatherForecastResponseToJson(this);
}

@JsonSerializable()
class ForecastItem {
  final int dt;
  final MainInfo main;
  final List<WeatherInfo> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Sys? sys;
  @JsonKey(name: 'dt_txt')
  final String dtTxt;

  ForecastItem({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    this.sys,
    required this.dtTxt,
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastItemToJson(this);
}

@JsonSerializable()
class Coord {
  final double lon;
  final double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
  Map<String, dynamic> toJson() => _$CoordToJson(this);
}

@JsonSerializable()
class WeatherInfo {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherInfo({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherInfoToJson(this);
}

@JsonSerializable()
class MainInfo {
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  final int pressure;
  final int humidity;
  @JsonKey(name: 'sea_level')
  final int? seaLevel;
  @JsonKey(name: 'grnd_level')
  final int? grndLevel;

  MainInfo({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory MainInfo.fromJson(Map<String, dynamic> json) =>
      _$MainInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MainInfoToJson(this);
}

@JsonSerializable()
class Wind {
  final double speed;
  final int deg;
  final double? gust;

  Wind({required this.speed, required this.deg, this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
  Map<String, dynamic> toJson() => _$WindToJson(this);
}

@JsonSerializable()
class Clouds {
  final int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@JsonSerializable()
class Sys {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;
  final String? pod; // Part of day (d/n) for forecast

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset, this.pod});

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
  Map<String, dynamic> toJson() => _$SysToJson(this);
}

@JsonSerializable()
class City {
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class OpenWeatherLocation {
  final String name;
  final double lat;
  final double lon;
  final String country;
  final String? state;

  OpenWeatherLocation({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    this.state,
  });

  factory OpenWeatherLocation.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherLocationFromJson(json);
  Map<String, dynamic> toJson() => _$OpenWeatherLocationToJson(this);
}
