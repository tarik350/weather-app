import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/data/model/setting.dart';

class SettingServices {
  late AppConfig config;

  Future<void> init() async {
    await dotenv.load(fileName: ".env");
    config = AppConfig.fromMap(dotenv.env);
  }
}
