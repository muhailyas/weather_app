import 'package:dio/dio.dart';
import 'package:weather_app/core/constants/api_constants.dart';

class WeatherApiService {
  Dio dio = Dio();
  Future<Response> fetchCurrentWeather({required String location}) async {
    final String url = ApiConstants.getBaseUrl(location: location);
    final Response response = await dio.get(url);
    return response;
  }
}
