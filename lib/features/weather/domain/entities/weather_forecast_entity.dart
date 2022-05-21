import 'package:equatable/equatable.dart';
import 'package:flutter_application_cube/features/weather/domain/entities/weather_entity.dart';

class WeatherForecastEntity extends Equatable {
  final DateTime dt;
  final String? sunrise;
  final String? sunset;
  final num temp;
  final num feelsLike;
  final int pressure;
  final int humidity;
  final num uvi;
  final int clouds;
  final num windSpeed;
  final num windDeg;
  final WeatherEntity? weatherEntity;

  const WeatherForecastEntity(
      {required this.dt,
      required this.sunrise,
      required this.sunset,
      required this.temp,
      required this.feelsLike,
      required this.pressure,
      required this.humidity,
      required this.uvi,
      required this.clouds,
      required this.windSpeed,
      required this.windDeg,
      required this.weatherEntity});

  @override
  List<Object?> get props => [dt, temp];
}
