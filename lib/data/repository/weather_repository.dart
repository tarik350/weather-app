import 'package:weather_app/data/model/weather.dart';
import 'package:weather_app/services/init_services.dart';
import 'package:weather_app/services/storage_service.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherRepository {
  final _weatherService = getIt<WeatherService>();
  final _storageService = getIt<StorageService>();

  Future<WeatherModel> getWeather(String searchString) async {
    final cachedWeather =
        _storageService.getWeatherResponse(searchString.toLowerCase());
    if (cachedWeather != null) {
      return cachedWeather;
    }

    try {
      final Map<String, dynamic> weatherMap =
          await _weatherService.fetchWeather(searchString);
      final weatherResponse = WeatherModel.fromJson(weatherMap);
      await _storageService.saveWeatherResponse(
          searchString.toLowerCase(), weatherResponse);
      return weatherResponse;
    } catch (e) {
      rethrow;
    }
  }
}
