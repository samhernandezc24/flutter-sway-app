import 'package:flutter_sway_app/features/weather_forecasts/domain/entities/weather.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    DateTime? date,
    int? temperatureC,
    int? temperatureF,
    String? summary,
  }): super(
    date: date,
    temperatureC: temperatureC,
    temperatureF: temperatureF,
    summary: summary,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> map) {
    return WeatherModel(
      date: DateTime.parse(map['date']),
      temperatureC: map['temperatureC'] ?? 0.0,
      temperatureF: map['temperatureF'] ?? 0.0,
      summary: map['summary'] ?? '',
    );
  }

  factory WeatherModel.fromEntity(WeatherEntity entity) {
    return WeatherModel(
      date: entity.date,
      temperatureC: entity.temperatureC,
      temperatureF: entity.temperatureF,
      summary: entity.summary,
    );
  }
}