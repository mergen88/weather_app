import 'package:flutter/material.dart';
import 'package:flutter_application_cube/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:flutter_application_cube/features/weather/presentation/widgets/forecast_weather.dart';
import 'package:flutter_application_cube/features/weather/presentation/widgets/main_weather_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainWeatherPage extends StatefulWidget {
  const MainWeatherPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainWeatherPageState();
  }
}

class _MainWeatherPageState extends State<MainWeatherPage>
    with TickerProviderStateMixin {
  late Animation<double> animationScale;
  late Animation<double> animationOpacity;
  late AnimationController animController;
  late bool searchIsOpened;
  final _searchController = TextEditingController();

  @override
  void initState() {
    animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    animationOpacity = Tween(begin: 0.0, end: 1.0).animate(animController);
    animationScale = Tween(begin: 0.0, end: 50.0).animate(animController);
    searchIsOpened = false;

    super.initState();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _update(context);
    _searchController.text = context.read<WeatherCubit>().currentPlace;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
              onPressed: () {
                _update(context);
              },
              icon: const Icon(Icons.replay)),
          IconButton(
              onPressed: () {
                if (this.searchIsOpened) {
                  this.searchIsOpened = false;
                  animController.reverse();
                  FocusManager.instance.primaryFocus?.unfocus();
                } else {
                  this.searchIsOpened = true;
                  animController.forward();
                }
              },
              icon: Icon(Icons.location_city))
        ],
      ),
      body: AnimatedBuilder(
          animation: animController,
          builder: (context, _) {
            return BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
              if (state is WeatherLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              }
              if (state is WeatherError) {
                return Center(
                    child: Text(
                  textAlign: TextAlign.center,
                  'ERROR: \n ${state.message}',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ));
              }
              if (state is WeatherLoaded) {
                final currentWeather = state.weatherGeoEntity.current;
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                        currentWeather?.weatherEntity?.main == 'Fog'
                            ? 'assets/weather/regular/fog_bk.jpg'
                            : 'assets/weather/regular/${currentWeather?.weatherEntity?.icon}_bk.jpg',
                        alignment: Alignment.center,
                        fit: BoxFit.cover),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Opacity(
                          opacity: animationOpacity.value,
                          child: Container(
                            margin: EdgeInsets.only(top: 16),
                            padding: EdgeInsets.only(left: 16, right: 16),
                            height: animationScale.value,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: TextField(
                                  controller: _searchController,
                                  onSubmitted: (place) {
                                    _loadWeather(context, place);
                                  },
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(bottom: 5),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    icon: Icon(Icons.search),
                                  )),
                            ),
                          ),
                        ),
                        const MainWeatherCard(),
                        const SizedBox(
                          height: 100,
                        ),
                        ForecastWeather(
                            weatherEntities: state.weatherGeoEntity.daily ?? [])
                      ],
                    )
                  ],
                );
              } else {
                return Container();
              }
            });
          }),
    );
  }

  void _update(BuildContext context) {
    context.read<WeatherCubit>().loadWeather();
  }

  void _loadWeather(BuildContext context, String place) {
    print('loadWeather ${place}');
    context.read<WeatherCubit>().loadWeather(place);
  }
}
