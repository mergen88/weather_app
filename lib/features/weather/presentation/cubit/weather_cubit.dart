import 'package:equatable/equatable.dart';
import 'package:flutter_application_cube/core/error/failure.dart';
import 'package:flutter_application_cube/features/weather/domain/entities/weather_geo_entity.dart';
import 'package:flutter_application_cube/features/weather/domain/usecases/get_weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeather getWeather;
  String currentPlace = 'Almaty';
  WeatherCubit({required this.getWeather}) : super(WeatherLoading());

  void loadWeather([String? place = null]) async {
    emit(WeatherLoading());
    final weather =
        await getWeather(WeatherPlaceParams(place: place ?? currentPlace));

    if (weather.left != null) {
      emit(WeatherError(message: _mapFailureToMessage(weather.left!)));
    } else if (weather.right != null) {
      if (place != null) {
        currentPlace = place;
      }

      emit(WeatherLoaded(weather.right!));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'server error';
      case InternetFailure:
        return 'internet error';
      default:
        return 'Unexpected Error';
    }
  }
}
