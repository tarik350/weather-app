import 'package:hive_flutter/hive_flutter.dart';

part 'adapter_models.g.dart';

@HiveType(typeId: 0)
class Coord {
  @HiveField(0)
  final double lon;

  @HiveField(1)
  final double lat;

  Coord({
    required this.lon,
    required this.lat,
  });
}

@HiveType(typeId: 1)
class Weather {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String main;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
}

@HiveType(typeId: 2)
class Main {
  @HiveField(0)
  final double temp;

  @HiveField(1)
  final double feelsLike;

  @HiveField(2)
  final double tempMin;

  @HiveField(3)
  final double tempMax;

  @HiveField(4)
  final int pressure;

  @HiveField(5)
  final int humidity;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });
}

@HiveType(typeId: 3)
class Wind {
  @HiveField(0)
  final double speed;

  @HiveField(1)
  final int deg;

  Wind({
    required this.speed,
    required this.deg,
  });
}

@HiveType(typeId: 4)
class Clouds {
  @HiveField(0)
  final int all;

  Clouds({
    required this.all,
  });
}

@HiveType(typeId: 5)
class Sys {
  @HiveField(0)
  final int type;

  @HiveField(1)
  final int id;

  @HiveField(2)
  final String country;

  @HiveField(3)
  final int sunrise;

  @HiveField(4)
  final int sunset;

  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });
}

@HiveType(typeId: 6)
class WeatherModel {
  @HiveField(0)
  final Coord coord;

  @HiveField(1)
  final List<Weather> weather;

  @HiveField(2)
  final String base;

  @HiveField(3)
  final Main main;

  @HiveField(4)
  final int visibility;

  @HiveField(5)
  final Wind wind;

  @HiveField(6)
  final Clouds clouds;

  @HiveField(7)
  final int dt;

  @HiveField(8)
  final Sys sys;

  @HiveField(9)
  final int timezone;

  @HiveField(10)
  final int id;

  @HiveField(11)
  final String name;

  @HiveField(12)
  final int cod;

  WeatherModel({
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
}
