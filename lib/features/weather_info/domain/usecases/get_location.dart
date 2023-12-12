import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/weather_info/domain/entities/location_data_entity/location_data_entity.dart';
import 'package:weather_app/features/weather_info/domain/repository/location_repository.dart';

class GetLocationUseCase implements UseCase<LocationDataEntity, void> {
  final LocationRepository _locationRepository;
  GetLocationUseCase(this._locationRepository);
  @override
  Future<LocationDataEntity> call({void params}) {
    return _locationRepository.fetchLocation();
  }
}
