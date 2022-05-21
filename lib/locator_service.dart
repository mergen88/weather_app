import 'package:flutter_application_cube/features/weather/data/datasources/weather_data_source.dart';
import 'package:flutter_application_cube/features/weather/data/repositories/weather_data_repository_impl.dart';
import 'package:flutter_application_cube/features/weather/domain/repositories/weather_data_repository.dart';
import 'package:flutter_application_cube/features/weather/domain/usecases/get_weather.dart';
import 'package:flutter_application_cube/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => WeatherCubit(getWeather: sl()));

  sl.registerLazySingleton(() => GetWeather(sl()));

  sl.registerLazySingleton<WeatherDataRepository>(
      () => WeatherDataRepositoryImpl(weatherDataSource: sl()));

  sl.registerLazySingleton<WeatherDataSource>(
    () => WeatherDataSourceImpl(client: http.Client()),
  );

  sl.registerLazySingleton(() => http.Client());
}
