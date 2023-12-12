part of 'location_bloc.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.loading() = _Loading;
  const factory LocationState.success({
    required LocationDataEntity location,
  }) = LocationFetchSuccess;
  const factory LocationState.failure({
    required String error,
  }) = _Failure;
}
