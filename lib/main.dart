import 'package:flutter/material.dart';
import 'package:flutter_application_cube/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:flutter_application_cube/features/weather/presentation/pages/main_weather_page.dart';
import 'package:flutter_application_cube/locator_service.dart' as di;
import 'package:flutter_application_cube/locator_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<WeatherCubit>(
            create: (context) => sl<WeatherCubit>(),
          )
        ],
        child: MaterialApp(
          title: 'Weather',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const MainWeatherPage(),
          },
        ));
  }
}
