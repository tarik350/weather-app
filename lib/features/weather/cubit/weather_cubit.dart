import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/model/weather.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit(this.weatherRepository) : super(WeatherInitial());

  Future<void> fetchWeather(String searchString) async {
    emit(WeatherLoading());
    try {
      final weatherResponse = await weatherRepository.getWeather(searchString);
      emit(WeatherLoaded(weatherResponse));
    } on SocketException catch (_) {
      emit(WeatherError('Please check your Internet connection'));
    } catch (error) {
      emit(WeatherError('Failed to fetch weather data'));
    }
  }
}
