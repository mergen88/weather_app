import 'package:flutter/material.dart';
import 'package:flutter_application_cube/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

class MainWeatherCard extends StatelessWidget {
  const MainWeatherCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      if (state is WeatherLoaded) {
        final currentWeather = state.weatherGeoEntity.current;
        final mainTemp = (currentWeather!.temp * 10).round() / 10;
        final feelTemp = (currentWeather.feelsLike * 10).round() / 10;
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Color(0x80404040),
          elevation: 24,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image(
                                alignment: Alignment.topCenter,
                                height: 60,
                                image: AssetImage(
                                    'assets/weather/256w/${currentWeather.weatherEntity?.icon}.png')),
                            Text(
                              '${currentWeather.weatherEntity?.main}',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 0,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '${mainTemp} °C',
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(FontAwesomeIcons.wind,
                                    color: Colors.white, size: 14),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${currentWeather.windSpeed}m/s',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  child: const Icon(WeatherIcons.humidity,
                                      color: Colors.white, size: 14),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${currentWeather.humidity}%',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  child: const Icon(WeatherIcons.barometer,
                                      color: Colors.white, size: 14),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${currentWeather.pressure} hPa',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text('Feels like ${feelTemp}',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: 1,
                  height: 100,
                  color: Colors.white,
                ),
                Wrap(
                  spacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  children: [
                    Text(
                      '${context.read<WeatherCubit>().currentPlace}',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      maxLines: 2,
                    ),
                    Text(
                      '${DateFormat('dd-MMMM-yyyy').format(currentWeather.dt)}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          WeatherIcons.sunrise,
                          color: Colors.yellow[500],
                          size: 10,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${currentWeather.sunrise}',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w200),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(
                          WeatherIcons.sunset,
                          color: Colors.yellow[800],
                          size: 10,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${currentWeather.sunset}',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
