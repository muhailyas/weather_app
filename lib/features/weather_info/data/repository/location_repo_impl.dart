import 'package:geolocator/geolocator.dart';
import 'package:weather_app/features/weather_info/data/data_sources/location_data_service.dart';
import 'package:weather_app/features/weather_info/domain/entities/location_data_entity/location_data_entity.dart';
import 'package:weather_app/features/weather_info/domain/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDataService _locationDataService;
  LocationRepositoryImpl(this._locationDataService);
  @override
  Future<LocationDataEntity> fetchLocation() async {
    try {
      final premission = await Geolocator.requestPermission();
      if (premission == LocationPermission.denied) {
        throw Exception();
      }
      return await _locationDataService.getCurrentLocation();
    } catch (e) {
      throw Exception(e);
    }
  }
}
