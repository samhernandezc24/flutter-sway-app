class WeatherForecast {
  final DateTime date;
  final int temperatureC;
  final int temperatureF;
  final String summary;

  WeatherForecast(
      {required this.date,
      required this.temperatureC,
      required this.temperatureF,
      required this.summary});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      date: DateTime.parse(json['date']),
      temperatureC: json['temperatureC'],
      temperatureF: json['temperatureF'],
      summary: json['summary'],
    );
  }

  static List<WeatherForecast> fromJsonList(List<dynamic> list) {
    return list.map((json) => WeatherForecast.fromJson(json)).toList();
  }
}
