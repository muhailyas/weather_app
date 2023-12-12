import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/weather_info/data/data_sources/location_data_service.dart';
import 'package:weather_app/features/weather_info/data/data_sources/weather_api_service.dart';
import 'package:weather_app/features/weather_info/data/repository/location_repo_impl.dart';
import 'package:weather_app/features/weather_info/data/repository/weather_repo_impl.dart';
import 'package:weather_app/features/weather_info/domain/repository/location_repository.dart';
import 'package:weather_app/features/weather_info/domain/repository/weather_repository.dart';
import 'package:weather_app/features/weather_info/domain/usecases/get_location.dart';
import 'package:weather_app/features/weather_info/domain/usecases/get_weather.dart';
import 'package:weather_app/features/weather_info/presentation/bloc/location/location_bloc.dart';
import 'package:weather_app/features/weather_info/presentation/bloc/weather/weather_bloc.dart';

final sl = GetIt.instance;
Future<void> initializeDepedencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<WeatherApiService>(WeatherApiService());

  sl.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(sl()));

  sl.registerSingleton<LocationDataService>(LocationDataService());

  sl.registerSingleton<LocationRepository>(LocationRepositoryImpl(sl()));

  //usecases
  sl.registerSingleton<GetWeatherUseCase>(GetWeatherUseCase(sl()));

  sl.registerSingleton<GetLocationUseCase>(GetLocationUseCase(sl()));

  //blocs
  sl.registerFactory<WeatherBloc>(() => WeatherBloc(sl()));

  sl.registerFactory<LocationBloc>(() => LocationBloc(sl()));

}
