part of 'get_one_place_cubit.dart';

@immutable
abstract class GetOnePlaceState {}

class GetOnePlaceInitial extends GetOnePlaceState {}

class GetOnePlaceLoading extends GetOnePlaceState {}

class GetOnePlaceSuccess extends GetOnePlaceState {
  GetOnePlaceSuccess({required this.placeModel});

  final PlaceModel placeModel;
}
