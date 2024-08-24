import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/data/model/weather.dart';

class WeatherResponseAdapter extends TypeAdapter<WeatherModel> {
  @override
  final typeId = 6;

  @override
  WeatherModel read(BinaryReader reader) {
    final coord = reader.read();
    final weather = reader.readList().cast<Weather>();
    final base = reader.readString();
    final main = reader.read();
    final visibility = reader.readInt();
    final wind = reader.read();
    final clouds = reader.read();
    final dt = reader.readInt();
    final sys = reader.read();
    final timezone = reader.readInt();
    final id = reader.readInt();
    final name = reader.readString();
    final cod = reader.readInt();
    return WeatherModel(
      coord: coord,
      weather: weather,
      base: base,
      main: main,
      visibility: visibility,
      wind: wind,
      clouds: clouds,
      dt: dt,
      sys: sys,
      timezone: timezone,
      id: id,
      name: name,
      cod: cod,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherModel obj) {
    writer.write(obj.coord);
    writer.writeList(obj.weather);
    writer.writeString(obj.base);
    writer.write(obj.main);
    writer.writeInt(obj.visibility);
    writer.write(obj.wind);
    writer.write(obj.clouds);
    writer.writeInt(obj.dt);
    writer.write(obj.sys);
    writer.writeInt(obj.timezone);
    writer.writeInt(obj.id);
    writer.writeString(obj.name);
    writer.writeInt(obj.cod);
  }
}
