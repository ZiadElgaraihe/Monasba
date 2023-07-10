import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/network/models/place_model.dart';

part 'saved_places_state.dart';

class SavedPlacesCubit extends Cubit<SavedPlacesState> {
  SavedPlacesCubit() : super(SavedPlacesInitial());

  List<PlaceModel> savedPlaces = [];

  void addAndRemovePlaces({required PlaceModel placeModel}) {
    int index = savedPlaces.indexWhere((p) => p.id == placeModel.id);
    if (index != -1) {
      savedPlaces.removeAt(index);
      emit(SavedPlacesInitial());
    } else {
      savedPlaces.add(placeModel);
      emit(SavedPlacesInitial());
    }
  }

  void removePlaces({required int index}) {
    savedPlaces.removeAt(index);
    emit(SavedPlacesInitial());
  }
}
