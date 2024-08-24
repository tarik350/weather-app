import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/data/model/weather.dart';

class WeatherAdapter extends TypeAdapter<Weather> {
  @override
  final typeId = 1;

  @override
  Weather read(BinaryReader reader) {
    final id = reader.readInt();
    final main = reader.readString();
    final description = reader.readString();
    final icon = reader.readString();
    return Weather(id: id, main: main, description: description, icon: icon);
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.main);
    writer.writeString(obj.description);
    writer.writeString(obj.icon);
  }
}
