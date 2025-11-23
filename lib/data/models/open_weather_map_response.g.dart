// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_weather_map_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenWeatherCurrentResponse _$OpenWeatherCurrentResponseFromJson(
  Map<String, dynamic> json,
) => OpenWeatherCurrentResponse(
  coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
  weather: (json['weather'] as List<dynamic>)
      .map((e) => WeatherInfo.fromJson(e as Map<String, dynamic>))
      .toList(),
  base: json['base'] as String,
  main: MainInfo.fromJson(json['main'] as Map<String, dynamic>),
  visibility: (json['visibility'] as num).toInt(),
  wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
  clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
  dt: (json['dt'] as num).toInt(),
  sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
  timezone: (json['timezone'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  cod: (json['cod'] as num).toInt(),
);

Map<String, dynamic> _$OpenWeatherCurrentResponseToJson(
  OpenWeatherCurrentResponse instance,
) => <String, dynamic>{
  'coord': instance.coord,
  'weather': instance.weather,
  'base': instance.base,
  'main': instance.main,
  'visibility': instance.visibility,
  'wind': instance.wind,
  'clouds': instance.clouds,
  'dt': instance.dt,
  'sys': instance.sys,
  'timezone': instance.timezone,
  'id': instance.id,
  'name': instance.name,
  'cod': instance.cod,
};

OpenWeatherForecastResponse _$OpenWeatherForecastResponseFromJson(
  Map<String, dynamic> json,
) => OpenWeatherForecastResponse(
  cod: json['cod'] as String,
  message: (json['message'] as num).toInt(),
  cnt: (json['cnt'] as num).toInt(),
  list: (json['list'] as List<dynamic>)
      .map((e) => ForecastItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  city: City.fromJson(json['city'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OpenWeatherForecastResponseToJson(
  OpenWeatherForecastResponse instance,
) => <String, dynamic>{
  'cod': instance.cod,
  'message': instance.message,
  'cnt': instance.cnt,
  'list': instance.list,
  'city': instance.city,
};

ForecastItem _$ForecastItemFromJson(Map<String, dynamic> json) => ForecastItem(
  dt: (json['dt'] as num).toInt(),
  main: MainInfo.fromJson(json['main'] as Map<String, dynamic>),
  weather: (json['weather'] as List<dynamic>)
      .map((e) => WeatherInfo.fromJson(e as Map<String, dynamic>))
      .toList(),
  clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
  wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
  visibility: (json['visibility'] as num).toInt(),
  pop: (json['pop'] as num).toDouble(),
  sys: json['sys'] == null
      ? null
      : Sys.fromJson(json['sys'] as Map<String, dynamic>),
  dtTxt: json['dt_txt'] as String,
);

Map<String, dynamic> _$ForecastItemToJson(ForecastItem instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'pop': instance.pop,
      'sys': instance.sys,
      'dt_txt': instance.dtTxt,
    };

Coord _$CoordFromJson(Map<String, dynamic> json) => Coord(
  lon: (json['lon'] as num).toDouble(),
  lat: (json['lat'] as num).toDouble(),
);

Map<String, dynamic> _$CoordToJson(Coord instance) => <String, dynamic>{
  'lon': instance.lon,
  'lat': instance.lat,
};

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) => WeatherInfo(
  id: (json['id'] as num).toInt(),
  main: json['main'] as String,
  description: json['description'] as String,
  icon: json['icon'] as String,
);

Map<String, dynamic> _$WeatherInfoToJson(WeatherInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

MainInfo _$MainInfoFromJson(Map<String, dynamic> json) => MainInfo(
  temp: (json['temp'] as num).toDouble(),
  feelsLike: (json['feels_like'] as num).toDouble(),
  tempMin: (json['temp_min'] as num).toDouble(),
  tempMax: (json['temp_max'] as num).toDouble(),
  pressure: (json['pressure'] as num).toInt(),
  humidity: (json['humidity'] as num).toInt(),
  seaLevel: (json['sea_level'] as num?)?.toInt(),
  grndLevel: (json['grnd_level'] as num?)?.toInt(),
);

Map<String, dynamic> _$MainInfoToJson(MainInfo instance) => <String, dynamic>{
  'temp': instance.temp,
  'feels_like': instance.feelsLike,
  'temp_min': instance.tempMin,
  'temp_max': instance.tempMax,
  'pressure': instance.pressure,
  'humidity': instance.humidity,
  'sea_level': instance.seaLevel,
  'grnd_level': instance.grndLevel,
};

Wind _$WindFromJson(Map<String, dynamic> json) => Wind(
  speed: (json['speed'] as num).toDouble(),
  deg: (json['deg'] as num).toInt(),
  gust: (json['gust'] as num?)?.toDouble(),
);

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
  'speed': instance.speed,
  'deg': instance.deg,
  'gust': instance.gust,
};

Clouds _$CloudsFromJson(Map<String, dynamic> json) =>
    Clouds(all: (json['all'] as num).toInt());

Map<String, dynamic> _$CloudsToJson(Clouds instance) => <String, dynamic>{
  'all': instance.all,
};

Sys _$SysFromJson(Map<String, dynamic> json) => Sys(
  type: (json['type'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  country: json['country'] as String?,
  sunrise: (json['sunrise'] as num?)?.toInt(),
  sunset: (json['sunset'] as num?)?.toInt(),
  pod: json['pod'] as String?,
);

Map<String, dynamic> _$SysToJson(Sys instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'country': instance.country,
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
  'pod': instance.pod,
};

City _$CityFromJson(Map<String, dynamic> json) => City(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
  country: json['country'] as String,
  population: (json['population'] as num).toInt(),
  timezone: (json['timezone'] as num).toInt(),
  sunrise: (json['sunrise'] as num).toInt(),
  sunset: (json['sunset'] as num).toInt(),
);

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'coord': instance.coord,
  'country': instance.country,
  'population': instance.population,
  'timezone': instance.timezone,
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
};

OpenWeatherLocation _$OpenWeatherLocationFromJson(Map<String, dynamic> json) =>
    OpenWeatherLocation(
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      country: json['country'] as String,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$OpenWeatherLocationToJson(
  OpenWeatherLocation instance,
) => <String, dynamic>{
  'name': instance.name,
  'lat': instance.lat,
  'lon': instance.lon,
  'country': instance.country,
  'state': instance.state,
};
