import 'package:dio/dio.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather_info/data/data_sources/weather_api_service.dart';
import 'package:weather_app/features/weather_info/data/model/weather_model/weather_model.dart';
import 'package:weather_app/features/weather_info/domain/entities/weather_entity/weather_entity.dart';
import 'package:weather_app/features/weather_info/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService _weatherApiService;
  WeatherRepositoryImpl(this._weatherApiService);
  @override
  Future<DataState<WeatherEntity>> fetchCurrentWeather(
      {required String location}) async {
    try {
      final httpResponse =
          await _weatherApiService.fetchCurrentWeather(location: location);
      if (httpResponse.statusCode == 200) {
        return DataSuccess(weatherFromJson(httpResponse.data));
      } else {
        return DataFailed(DioException(
            requestOptions: httpResponse.requestOptions,
            type: DioExceptionType.badResponse,
            response: httpResponse));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
