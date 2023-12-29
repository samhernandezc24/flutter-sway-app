import 'package:flutter_sway_app/core/resources/data_state.dart';
import 'package:flutter_sway_app/features/weather_forecasts/domain/entities/weather.dart';

abstract class WeatherRepository {
  // API METHODS
  Future<DataState<List<WeatherEntity>>> getNewWeatherForecasts();
}