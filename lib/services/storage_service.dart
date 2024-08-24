import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/data/adapter/cloud_adapter.dart';
import 'package:weather_app/data/adapter/coord_adapter.dart';
import 'package:weather_app/data/adapter/main_adapter.dart';
import 'package:weather_app/data/adapter/sys_adapter.dart';
import 'package:weather_app/data/adapter/weather_adapter.dart';
import 'package:weather_app/data/adapter/weather_response_adapter.dart';
import 'package:weather_app/data/adapter/wind_adapter.dart';
import 'package:weather_app/data/model/weather.dart';

class StorageService {
  static const String _weatherBoxName = 'weatherBox';

  Future<void> init() async {
    try {
      await Hive.initFlutter();

      // Register Hive adapters
      Hive.registerAdapter(CoordAdapter());
      Hive.registerAdapter(WeatherAdapter());
      Hive.registerAdapter(MainAdapter());
      Hive.registerAdapter(WindAdapter());
      Hive.registerAdapter(CloudsAdapter());
      Hive.registerAdapter(SysAdapter());
      Hive.registerAdapter(WeatherResponseAdapter());

      await Hive.openBox<WeatherModel>(_weatherBoxName);
    } catch (e) {
      debugPrint('Error initializing Hive: $e');
      rethrow;
    }
  }

  // Get the weather box
  Box<WeatherModel> getWeatherBox() {
    try {
      return Hive.box<WeatherModel>(_weatherBoxName);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Save a single WeatherModel object to the box
  Future<void> saveWeatherResponse(
      String key, WeatherModel weatherResponse) async {
    try {
      final box = getWeatherBox();
      await box.put(key, weatherResponse);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Retrieve a WeatherModel from the box based on city name
  WeatherModel? getWeatherResponse(String cityName) {
    try {
      final box = getWeatherBox();
      return box.get(cityName);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Method to get all WeatherModel objects
  List<WeatherModel> getAllWeatherResponses() {
    try {
      final box = getWeatherBox();
      return box.values.toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Clear the weather box
  Future<bool> clearWeatherBox() async {
    try {
      // Delete the box from disk
      await Hive.deleteBoxFromDisk(_weatherBoxName);

      // Reinitialize Hive and open the box again
      await Hive.openBox<WeatherModel>(_weatherBoxName);
      return true;
    } catch (e) {
      debugPrint('Error clearing and reinitializing box: $e');
      return false;
    }
  }
}
