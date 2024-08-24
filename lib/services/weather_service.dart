import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/model/setting.dart';
import 'package:weather_app/services/init_services.dart';
import 'package:weather_app/services/setting_services.dart';

class WeatherService {
  static final AppConfig config = getIt<SettingServices>().config;
  final String apiKey = config.apikey;
  final String baseUrl = config.baseURL;

  Future<Map<String, dynamic>> fetchWeather(String cityName) async {
    final response = await http
        .get(Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
