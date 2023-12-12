import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/features/weather_info/domain/entities/location_data_entity/location_data_entity.dart';

class LocationDataService {
  Future<LocationDataEntity> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      List<Placemark> placemark =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      String country = placemark.isNotEmpty
          ? placemark.first.locality ?? 'Unknown'
          : 'Unknown';
      return LocationDataEntity(
          latitude: position.latitude,
          longitude: position.longitude,
          location: country);
    } catch (e) {
      throw Exception("Failed to fetch current location:$e");
    }
  }
}
