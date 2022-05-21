import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:flutter_application_cube/core/error/exception.dart';
import 'package:flutter_application_cube/features/weather/data/datasources/weather_data_source.dart';
import 'package:flutter_application_cube/features/weather/domain/entities/weather_location_entity.dart';
import 'package:flutter_application_cube/features/weather/domain/entities/weather_geo_entity.dart';
import 'package:flutter_application_cube/core/error/failure.dart';
import 'package:flutter_application_cube/features/weather/domain/repositories/weather_data_repository.dart';

class WeatherDataRepositoryImpl extends WeatherDataRepository {
  final WeatherDataSource weatherDataSource;

  WeatherDataRepositoryImpl({required this.weatherDataSource});

  @override
  Future<Pair<Failure, WeatherGeoEntity>> getWeather(String place) async {
    try {
      final weatherLocation = await weatherDataSource.getWeatherLocation(place);
      final lat = weatherLocation.lat;
      final lon = weatherLocation.lon;
      final weatherData = await weatherDataSource.getGeoWeather(lat, lon);
      return Pair(null, weatherData);
    } on ServerException {
      return Pair(ServerFailure(), null);
    } on InternetException {
      return Pair(InternetFailure(), null);
    }
  }
}
