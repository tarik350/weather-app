import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/data/model/weather.dart';

class WindAdapter extends TypeAdapter<Wind> {
  @override
  final typeId = 3;

  @override
  Wind read(BinaryReader reader) {
    final speed = reader.readDouble();
    final deg = reader.readInt();
    return Wind(speed: speed, deg: deg);
  }

  @override
  void write(BinaryWriter writer, Wind obj) {
    writer.writeDouble(obj.speed);
    writer.writeInt(obj.deg);
  }
}
