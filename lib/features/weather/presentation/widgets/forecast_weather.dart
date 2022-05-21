import 'package:flutter/material.dart';
import 'package:flutter_application_cube/features/weather/domain/entities/weather_forecast_entity.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

class ForecastWeather extends StatelessWidget {
  final List<WeatherForecastEntity> weatherEntities;
  const ForecastWeather({Key? key, required this.weatherEntities})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '7 days forecast'.toUpperCase(),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: weatherEntities.length,
            itemBuilder: (context, index) {
              final weather = weatherEntities[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: const Color(0x90404040),
                elevation: 20,
                child: Container(
                    padding: const EdgeInsets.all(4),
                    width: 150,
                    child: Column(
                      children: [
                        Text(
                          '${DateFormat('EEEE dd MMMM').format(weather.dt)}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/weather/256w/${weather.weatherEntity?.icon}.png',
                              width: 30,
                            ),
                            Text(
                              '${weather.temp} °C',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              FontAwesomeIcons.wind,
                              size: 10,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              '${weather.windSpeed}m/s',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: const Icon(
                                WeatherIcons.humidity,
                                size: 10,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              '${weather.humidity}%',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: const Icon(
                                WeatherIcons.barometer,
                                size: 10,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              '${weather.pressure}hPa',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    )),
              );
            },
          ),
        ),
      ],
    );
  }
}
