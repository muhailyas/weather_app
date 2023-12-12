import 'package:weather_app/features/weather_info/domain/entities/current_entity/current_entity.dart';

import '../condition_model/condition_model.dart';

class CurrentModel extends CurrentEntity {
  const CurrentModel({
    required super.lastUpdatedEpoch,
    required super.lastUpdated,
    required super.tempC,
    required super.tempF,
    required super.isDay,
    required super.condition,
    required super.windMph,
    required super.windKph,
    required super.windDegree,
    required super.windDir,
    required super.pressureMb,
    required super.pressureIn,
    required super.precipMm,
    required super.precipIn,
    required super.humidity,
    required super.cloud,
    required super.feelslikeC,
    required super.feelslikeF,
    required super.visKm,
    required super.visMiles,
    required super.uv,
    required super.gustMph,
    required super.gustKph,
    required super.airQuality,
  });

  factory CurrentModel.fromJson(Map<String, dynamic> json) => CurrentModel(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"],
        tempF: json["temp_f"],
        isDay: json["is_day"],
        condition: ConditionModel.fromJson(json["condition"]),
        windMph: json["wind_mph"]?.toDouble(),
        windKph: json["wind_kph"].toDouble(),
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"],
        pressureIn: json["pressure_in"]?.toDouble(),
        precipMm: json["precip_mm"],
        precipIn: json["precip_in"],
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"]?.toDouble(),
        feelslikeF: json["feelslike_f"]?.toDouble(),
        visKm: json["vis_km"],
        visMiles: json["vis_miles"],
        uv: json["uv"],
        gustMph: json["gust_mph"],
        gustKph: json["gust_kph"]?.toDouble(),
        airQuality: Map.from(json["air_quality"])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
      );
}
