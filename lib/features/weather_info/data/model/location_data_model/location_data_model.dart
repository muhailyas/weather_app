import 'package:weather_app/features/weather_info/domain/entities/location_data_entity/location_data_entity.dart';

class LocationDataModel extends LocationDataEntity {
  const LocationDataModel({
    required super.latitude,
    required super.longitude,
    required super.location,
  });
}
