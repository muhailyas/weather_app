import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather_info/domain/entities/condition_entity/condition_entity.dart';

class CurrentEntity extends Equatable {
  final num lastUpdatedEpoch;
  final String lastUpdated;
  final num tempC;
  final num tempF;
  final num isDay;
  final ConditionEntity condition;
  final double windMph;
  final double windKph;
  final num windDegree;
  final String windDir;
  final num pressureMb;
  final double pressureIn;
  final num precipMm;
  final num precipIn;
  final num humidity;
  final num cloud;
  final double feelslikeC;
  final double feelslikeF;
  final num visKm;
  final num visMiles;
  final num uv;
  final num gustMph;
  final double gustKph;
  final Map<String, double> airQuality;

  const CurrentEntity({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
    required this.airQuality,
  });

  @override
  List<Object?> get props => [
        lastUpdatedEpoch,
        lastUpdated,
        tempC,
        tempF,
        isDay,
        condition,
        windMph,
        windKph,
        windDegree,
        windDir,
        pressureMb,
        pressureIn,
        precipMm,
        precipIn,
        humidity,
        cloud,
        feelslikeC,
        feelslikeF,
        visKm,
        visMiles,
        uv,
        gustMph,
        gustKph,
        airQuality
      ];
}
