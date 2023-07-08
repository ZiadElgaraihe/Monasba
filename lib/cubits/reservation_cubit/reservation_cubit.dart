import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());

  String? day,
      numberOfPersons,
      price,
      customerName,
      customerId,
      guarantorName,
      guarantorId,
      paymentWay,
      creditHolderName,
      creditNumber,
      expirationDate,
      securityCode;
  TimeOfDay? time;

  void selectDay(String day) {
    this.day = day;
    emit(ReservationInitial());
  }

  void selectTime(TimeOfDay time) {
    this.time = time;
    emit(ReservationInitial());
  }

  void selectPackage(String numberOfPersons, String price) {
    this.numberOfPersons = numberOfPersons;
    this.price = price;
  }

  void setCustomerInfo(
    String? customerName,
    String? customerId,
    String? guarantorName,
    String? guarantorId,
  ) {
    this.customerName = customerName;
    this.customerId = customerId;
    this.guarantorName = guarantorName;
    this.guarantorId = guarantorId;
  }

  void setPaymentWay(String paymentWay) {
    this.paymentWay = paymentWay;
  }

  void setPaymentInfo(
    String? creditHolderName,
    String? creditNumber,
    String? expirationDate,
    String? securityCode,
  ) {
    this.creditHolderName = creditHolderName;
    this.creditNumber = creditNumber;
    this.expirationDate = expirationDate;
    this.securityCode = securityCode;
  }
}
