import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/data/model/weather.dart';

class MainAdapter extends TypeAdapter<Main> {
  @override
  final typeId = 2;

  @override
  Main read(BinaryReader reader) {
    final temp = reader.readDouble();
    final feelsLike = reader.readDouble();
    final tempMin = reader.readDouble();
    final tempMax = reader.readDouble();
    final pressure = reader.readInt();
    final humidity = reader.readInt();
    return Main(
      temp: temp,
      feelsLike: feelsLike,
      tempMin: tempMin,
      tempMax: tempMax,
      pressure: pressure,
      humidity: humidity,
    );
  }

  @override
  void write(BinaryWriter writer, Main obj) {
    writer.writeDouble(obj.temp);
    writer.writeDouble(obj.feelsLike);
    writer.writeDouble(obj.tempMin);
    writer.writeDouble(obj.tempMax);
    writer.writeInt(obj.pressure);
    writer.writeInt(obj.humidity);
  }
}
