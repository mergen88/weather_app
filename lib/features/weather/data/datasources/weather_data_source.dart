import 'dart:convert';
import 'package:flutter_application_cube/core/constants.dart';
import 'package:flutter_application_cube/core/error/exception.dart';
import 'package:flutter_application_cube/features/weather/data/models/weather_geo_model.dart';
import 'package:flutter_application_cube/features/weather/data/models/weather_location_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherDataSource {
  Future<WeatherGeoModel> getGeoWeather(double lat, double lon);
  Future<WeatherLocationModel> getWeatherLocation(String place);
}

class WeatherDataSourceImpl implements WeatherDataSource {
  final http.Client client;

  WeatherDataSourceImpl({required this.client});

  @override
  Future<WeatherGeoModel> getGeoWeather(double lat, double lon) async {
    try {
      final uri = Uri.parse(
          'https://api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${lon}&cnt=10&appid=${Constants.API_KEY}&units=metric&exclude=hourly');
      final response = await client.get(uri, headers: {
        'Content-Type': 'application/json',
        "Access-Control_Allow_Origin": "*"
      });
      if (response.statusCode == 200) {
        final weatherGeo = jsonDecode(response.body);
        return WeatherGeoModel.fromJson(weatherGeo);
      } else {
        throw ServerException(response.statusCode);
      }
    } catch (error) {
      throw InternetException(error.toString());
    }
  }

  @override
  Future<WeatherLocationModel> getWeatherLocation(String place) async {
    try {
      final uri = Uri.parse(
          'https://api.openweathermap.org/geo/1.0/direct?q=${place}&limit=1&appid=${Constants.API_KEY}');
      final response = await client.get(uri, headers: {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
      });
      if (response.statusCode == 200) {
        final weatherLocations = jsonDecode(response.body);
        return (weatherLocations as List)
            .map((weatherLocation) =>
                WeatherLocationModel.fromJson(weatherLocation))
            .toList()
            .first;
      } else {
        throw ServerException(response.statusCode);
      }
    } catch (error) {
      throw InternetException(error.toString());
    }
  }
}
