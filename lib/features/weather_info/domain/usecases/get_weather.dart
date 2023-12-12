import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/weather_info/domain/entities/weather_entity/weather_entity.dart';
import 'package:weather_app/features/weather_info/domain/repository/weather_repository.dart';

class GetWeatherUseCase implements UseCase<DataState<WeatherEntity>, void> {
  final WeatherRepository _weatherRepository;
  GetWeatherUseCase(this._weatherRepository);

  @override
  Future<DataState<WeatherEntity>> call({void params}) {
    return _weatherRepository.fetchCurrentWeather(location: params as String);
  }
}
