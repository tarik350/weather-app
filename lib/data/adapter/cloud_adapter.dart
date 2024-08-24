import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/data/model/weather.dart';

class CloudsAdapter extends TypeAdapter<Clouds> {
  @override
  final typeId = 4;

  @override
  Clouds read(BinaryReader reader) {
    final all = reader.readInt();
    return Clouds(all: all);
  }

  @override
  void write(BinaryWriter writer, Clouds obj) {
    writer.writeInt(obj.all);
  }
}
