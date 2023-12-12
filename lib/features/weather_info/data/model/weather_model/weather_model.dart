import 'package:weather_app/features/weather_info/data/model/location_model/location_model.dart';
import 'package:weather_app/features/weather_info/domain/entities/weather_entity/weather_entity.dart';

import '../current_model/current_model.dart';

WeatherModel weatherFromJson(Map<String, dynamic> data) =>
    WeatherModel.fromJson(data);

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required super.location,
    required super.current,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: LocationModel.fromJson(json["location"]),
        current: CurrentModel.fromJson(json["current"]),
      );
}
