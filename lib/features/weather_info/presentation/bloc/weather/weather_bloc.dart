import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather_info/domain/entities/weather_entity/weather_entity.dart';
import 'package:weather_app/features/weather_info/domain/usecases/get_weather.dart';
part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase _getWeatherUseCase;
  WeatherBloc(this._getWeatherUseCase) : super(const Loading()) {
    on<_FetchWeather>(fetchWeather);
  }

  FutureOr<void> fetchWeather(event, Emitter<WeatherState> emit) async {
    final dataState = await _getWeatherUseCase(params: event.location);
    if (dataState is DataSuccess) {
      emit(WeatherState.success(weatherEntity: dataState.data!));
    } else {
      emit(WeatherState.failure(error: dataState.error!));
    }
  }
}
