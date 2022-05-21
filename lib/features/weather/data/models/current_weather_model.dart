import 'package:flutter_application_cube/features/weather/data/models/weather_model.dart';
import 'package:flutter_application_cube/features/weather/domain/entities/current_weather_entity.dart';
import 'package:intl/intl.dart';

class CurrentWeatherModel extends CurrentWeatherEntity {
  const CurrentWeatherModel(
      {required DateTime dt,
      required String? sunrise,
      required String? sunset,
      required num temp,
      required num feelsLike,
      required int pressure,
      required int humidity,
      required num uvi,
      required int clouds,
      required int visibility,
      required num windSpeed,
      required num windDeg,
      required WeatherModel? weatherModel})
      : super(
            dt: dt,
            sunrise: sunrise,
            sunset: sunset,
            temp: temp,
            feelsLike: feelsLike,
            pressure: pressure,
            humidity: humidity,
            uvi: uvi,
            clouds: clouds,
            visibility: visibility,
            windSpeed: windSpeed,
            windDeg: windDeg,
            weatherEntity: weatherModel);

  factory CurrentWeatherModel.formJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      dt: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      sunrise: json['sunrise'] != null
          ? DateFormat.Hm().format(
              DateTime.fromMillisecondsSinceEpoch(json['sunrise'] * 1000))
          : null,
      sunset: json['sunset'] != null
          ? DateFormat.Hm().format(
              DateTime.fromMillisecondsSinceEpoch(json['sunset'] * 1000))
          : null,
      temp: json['temp'],
      feelsLike: json['feels_like'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      uvi: json['uvi'],
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      weatherModel: json['weather'] != null
          ? WeatherModel.fromJson(json['weather'][0])
          : null,
    );
  }
}
