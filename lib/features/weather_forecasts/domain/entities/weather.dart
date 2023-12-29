class WeatherEntity {
  final DateTime? date;
  final int? temperatureC;
  final int? temperatureF;
  final String? summary;

  const WeatherEntity({
    this.date,
    this.temperatureC,
    this.temperatureF,
    this.summary,
  });

  @override
  List<Object?> get props {
    return [
      date,
      temperatureC,
      temperatureF,
      summary,
    ];
  }
}