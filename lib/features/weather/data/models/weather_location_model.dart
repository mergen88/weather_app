import 'package:flutter_application_cube/features/weather/domain/entities/weather_location_entity.dart';

class WeatherLocationModel extends WeatherLocationEntity {
  const WeatherLocationModel({
    required String name,
    required double lat,
    required double lon,
    required String country,
  }) : super(name: name, lat: lat, lon: lon, country: country);

  factory WeatherLocationModel.fromJson(Map<String, dynamic> json) {
    return WeatherLocationModel(
        name: json['name'],
        lat: json['lat'],
        lon: json['lon'],
        country: json['country']);
  }
}
