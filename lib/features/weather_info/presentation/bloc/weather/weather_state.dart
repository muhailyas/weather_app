part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.loading() = Loading;
  const factory WeatherState.success({
    required WeatherEntity weatherEntity,
  }) = Success;
  const factory WeatherState.failure({
    required DioException error,
  }) = Failure;
}
