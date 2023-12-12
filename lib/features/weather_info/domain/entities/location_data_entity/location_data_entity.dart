import 'package:equatable/equatable.dart';

class LocationDataEntity extends Equatable {
  final double latitude;
  final double longitude;
  final String location;
  const LocationDataEntity({
    required this.latitude,
    required this.longitude,
    required this.location,
  });
  @override
  List<Object?> get props => throw UnimplementedError();
}
