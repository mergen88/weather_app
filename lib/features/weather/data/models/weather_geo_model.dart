import 'package:flutter_application_cube/features/weather/data/models/current_weather_model.dart';
import 'package:flutter_application_cube/features/weather/data/models/weather_forecast_model.dart';
import 'package:flutter_application_cube/features/weather/domain/entities/weather_geo_entity.dart';

class WeatherGeoModel extends WeatherGeoEntity {
  const WeatherGeoModel(
      {required double lat,
      required double lon,
      required String timezone,
      required int timezoneOffset,
      required CurrentWeatherModel? current,
      required List<WeatherForecastModel>? daily})
      : super(
            lat: lat,
            lon: lon,
            timezone: timezone,
            timezoneOffset: timezoneOffset,
            current: current,
            daily: daily);
  factory WeatherGeoModel.fromJson(Map<String, dynamic> json) {
    return WeatherGeoModel(
        lat: json['lat'],
        lon: json['lon'],
        timezone: json['timezone'],
        timezoneOffset: json['timezone_offset'],
        current: json['current'] != null
            ? CurrentWeatherModel.formJson(json['current'])
            : null,
        daily: (json['daily'] as List<dynamic>)
            .map((e) => WeatherForecastModel.formJson(e))
            .toList());
  }
}
