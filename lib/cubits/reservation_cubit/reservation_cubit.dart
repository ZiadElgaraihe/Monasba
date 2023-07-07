import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());

  String? day;
  TimeOfDay? time;

  void selectDay(String day) {
    this.day = day;
    emit(ReservationDaySelected());
  }

  void selectTime(TimeOfDay time) {
    this.time = time;
    emit(ReservationTimeSelected());
  }
}
