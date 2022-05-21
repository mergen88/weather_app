import 'package:flutter_application_cube/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel(
      {required int id,
      required String main,
      required String description,
      required String icon})
      : super(id: id, main: main, description: description, icon: icon);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
