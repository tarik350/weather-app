import 'package:get_it/get_it.dart';
import 'package:weather_app/services/setting_services.dart';
import 'package:weather_app/services/storage_service.dart';
import 'package:weather_app/services/weather_service.dart';

final getIt = GetIt.instance;
Future<void> initService() async {
  var appSettingService = SettingServices();
  await appSettingService.init();
  getIt.registerSingleton<SettingServices>(appSettingService);
  var weatherService = WeatherService();
  getIt.registerSingleton<WeatherService>(weatherService);
  var storageService = StorageService();
  await storageService.init();
  getIt.registerSingleton<StorageService>(storageService);
}
