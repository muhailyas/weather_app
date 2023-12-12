import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/core/utils/get_weather_info_string.dart';
import 'package:weather_app/core/utils/utils.dart';
import 'package:weather_app/features/weather_info/presentation/bloc/location/location_bloc.dart';
import 'package:weather_app/features/weather_info/presentation/bloc/weather/weather_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<LocationBloc>()
          .add(const LocationEvent.fetchCurrentLocation());
    });
    return BlocListener<LocationBloc, LocationState>(
      listener: (context, state) {
        if (state is LocationFetchSuccess) {
          context.read<WeatherBloc>().add(
              WeatherEvent.fetchWeather(location: state.location.location));
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 40, 20),
          child: SizedBox(
            height: screenHeight,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(10, -0.3),
                  child: _buildCircularContainer(Colors.deepPurple),
                ),
                Align(
                  alignment: const AlignmentDirectional(-10, -0.3),
                  child: _buildCircularContainer(Colors.deepPurple),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1.2),
                  child: Container(
                    height: 300,
                    width: 600,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 247, 81, 233),
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Container(),
                ),
                _buildWeatherInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircularContainer(Color color) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  Widget _buildWeatherInfo() {
    return BlocBuilder<WeatherBloc, WeatherState>(
      buildWhen: (previous, current) => current is Success,
      builder: (context, state) {
        return SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state is Success
                    ? "${state.weatherEntity.location.name}, ${state.weatherEntity.location.country}"
                    : '📍 Kochi',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                currentGreeting(),
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              getWeatherIcon(
                  state is Success
                      ? state.weatherEntity.current.condition.text
                      : '',
                  null),
              Center(
                child: Text(
                  state is Success
                      ? "${state.weatherEntity.current.tempC.toStringAsFixed(0)}°C"
                      : "21°C",
                  style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  state is Success
                      ? GetWeatherInfoText.getWeatherInfo(
                          state.weatherEntity.current.condition.code,
                          state.weatherEntity.current.isDay == 1)
                      : "THUNDERSTROM",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: Text(
                  state is Success
                      ? formatLocalTime(state.weatherEntity.location.localtime)
                      : "Friday 16 . 09:41am",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/9.png',
                        scale: 8,
                      ),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Wind Speed",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            state is Success
                                ? "${state.weatherEntity.current.windKph} km/h"
                                : "10 km/h",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.network(
                        'https://imgs.search.brave.com/p0fRQf0P-vp43HnPzMzMGqF6XZboEs5HXD_M5Ku7jbE/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9hc3Nl/dHMuc3RpY2twbmcu/Y29tL2ltYWdlcy81/OWFlYjI3NDMyYmNk/ODc2MTVkMjc5Nzgu/cG5n',
                        scale: 8,
                      ),
                      const SizedBox(width: 1),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Wind Direction",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            state is Success
                                ? state.weatherEntity.current.windDir
                                : "",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Divider(color: Colors.grey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/13.png',
                        scale: 8,
                      ),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Current Temp",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            state is Success
                                ? state.weatherEntity.current.tempC.toString()
                                : "31°C",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      getWeatherIcon(
                          state is Success
                              ? state.weatherEntity.current.condition.text
                              : '',
                          8),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Condition",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(height: 3),
                          SizedBox(
                            width: screenWidth / 6,
                            child: Text(
                              state is Success
                                  ? state.weatherEntity.current.condition.text
                                      .toString()
                                  : "cool",
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
