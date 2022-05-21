import 'package:equatable/equatable.dart';
import 'package:flutter_application_cube/features/weather/domain/entities/current_weather_entity.dart';
import 'package:flutter_application_cube/features/weather/domain/entities/weather_forecast_entity.dart';

class WeatherGeoEntity extends Equatable {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final CurrentWeatherEntity? current;
  final List<WeatherForecastEntity>? daily;

  const WeatherGeoEntity(
      {required this.lat,
      required this.lon,
      required this.timezone,
      required this.timezoneOffset,
      required this.current,
      required this.daily});

  @override
  List<Object?> get props => [lat, lon, timezone];
}
