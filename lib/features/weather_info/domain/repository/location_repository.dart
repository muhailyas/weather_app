import 'package:weather_app/features/weather_info/domain/entities/location_data_entity/location_data_entity.dart';

abstract class LocationRepository {
  Future<LocationDataEntity> fetchLocation();
}
