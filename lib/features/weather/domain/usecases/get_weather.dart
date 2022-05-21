import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_cube/core/error/failure.dart';
import 'package:flutter_application_cube/core/usecases/usecase.dart';
import 'package:flutter_application_cube/features/weather/domain/entities/weather_geo_entity.dart';
import 'package:flutter_application_cube/features/weather/domain/repositories/weather_data_repository.dart';

class GetWeather extends UseCase<WeatherGeoEntity, WeatherPlaceParams> {
  final WeatherDataRepository weatherDataRepository;

  GetWeather(this.weatherDataRepository);

  @override
  Future<Pair<Failure, WeatherGeoEntity>> call(
      WeatherPlaceParams params) async {
    return await weatherDataRepository.getWeather(params.place);
  }
}

class WeatherPlaceParams extends Equatable {
  final String place;

  const WeatherPlaceParams({required this.place});

  @override
  List<Object?> get props => [place];
}
