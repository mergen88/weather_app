import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:flutter_application_cube/core/error/failure.dart';
import 'package:flutter_application_cube/features/weather/domain/entities/weather_geo_entity.dart';

abstract class WeatherDataRepository {
  Future<Pair<Failure, WeatherGeoEntity>> getWeather(String place);
}
