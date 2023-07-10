import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/network/models/place_model.dart';
import 'package:monasba/network/services/get_one_place_service.dart';

part 'get_one_place_state.dart';

class GetOnePlaceCubit extends Cubit<GetOnePlaceState> {
  GetOnePlaceCubit() : super(GetOnePlaceInitial());

  PlaceModel? placeModel;
  void getOnePlace({required String id, required String token}) async {
    emit(GetOnePlaceLoading());
    try {
      placeModel = await GetOnePlaceService().getOnePlace(id: id, token: token);
      emit(GetOnePlaceSuccess(placeModel: placeModel!));
    } catch (error) {
      print(error);
    }
  }
}
