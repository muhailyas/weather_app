import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather_info/domain/entities/current_entity/current_entity.dart';
import 'package:weather_app/features/weather_info/domain/entities/location_entity/location_entity.dart';

class WeatherEntity extends Equatable {
  final LocationEntity location;
  final CurrentEntity current;

  const WeatherEntity({
    required this.location,
    required this.current,
  });

  @override
  List<Object?> get props => [
        location,
        current,
      ];
}
