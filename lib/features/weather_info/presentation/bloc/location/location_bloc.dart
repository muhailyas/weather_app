import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/features/weather_info/domain/entities/location_data_entity/location_data_entity.dart';
import 'package:weather_app/features/weather_info/domain/usecases/get_location.dart';

part 'location_event.dart';
part 'location_state.dart';
part 'location_bloc.freezed.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocationUseCase _getLocationUseCase;
  LocationBloc(this._getLocationUseCase) : super(const _Loading()) {
    on<_FetchCurrentLocation>(fetchCurrentLocation);
  }

  FutureOr<void> fetchCurrentLocation(
      event, Emitter<LocationState> emit) async {
    final location = await _getLocationUseCase();
    if (location is Exception) {
      emit(const LocationState.failure(error: 'Error while fetching location'));
      return;
    }
    emit(LocationState.success(location: location));
  }
}
