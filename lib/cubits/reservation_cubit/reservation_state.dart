part of 'reservation_cubit.dart';

@immutable
abstract class ReservationState {}

class ReservationInitial extends ReservationState {}

class ReservationDaySelected extends ReservationState {}

class ReservationTimeSelected extends ReservationState {}
