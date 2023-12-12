import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather_info/domain/entities/weather_entity/weather_entity.dart';

abstract class WeatherRepository {
  Future<DataState<WeatherEntity>> fetchCurrentWeather({required String location});
}
