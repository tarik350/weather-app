import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/data/model/weather.dart';

class SysAdapter extends TypeAdapter<Sys> {
  @override
  final typeId = 5;

  @override
  Sys read(BinaryReader reader) {
    final type = reader.readInt();
    final id = reader.readInt();
    final country = reader.readString();
    final sunrise = reader.readInt();
    final sunset = reader.readInt();
    return Sys(
        type: type, id: id, country: country, sunrise: sunrise, sunset: sunset);
  }

  @override
  void write(BinaryWriter writer, Sys obj) {
    writer.writeInt(obj.type);
    writer.writeInt(obj.id);
    writer.writeString(obj.country);
    writer.writeInt(obj.sunrise);
    writer.writeInt(obj.sunset);
  }
}
