part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherGeoEntity weatherGeoEntity;

  const WeatherLoaded(this.weatherGeoEntity);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError({required this.message});
}
