import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/data/model/weather.dart';

class CoordAdapter extends TypeAdapter<Coord> {
  @override
  final typeId = 0;

  @override
  Coord read(BinaryReader reader) {
    final lon = reader.readDouble();
    final lat = reader.readDouble();
    return Coord(lon: lon, lat: lat);
  }

  @override
  void write(BinaryWriter writer, Coord obj) {
    writer.writeDouble(obj.lon);
    writer.writeDouble(obj.lat);
  }
}
