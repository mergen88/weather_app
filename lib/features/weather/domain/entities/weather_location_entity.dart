import 'package:equatable/equatable.dart';

class WeatherLocationEntity extends Equatable {
  final String name;
  final double lat;
  final double lon;
  final String country;

  const WeatherLocationEntity(
      {required this.name,
      required this.lat,
      required this.lon,
      required this.country});

  @override
  List<Object?> get props => [name, lat, lon];
}
