import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/network/services/sign_up_service.dart';

part 'sign_up_cubit_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpCubitInitial());

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String password,
    required String country,
    required String city,
    required String phoneNumber,
  }) async {
    emit(SignUpCubitLoading());
    try {
      await SignUpService().signUp(
        isSignUp: true,
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        email: email,
        password: password,
        country: country,
        city: city,
        phoneNumber: phoneNumber,
      );
      emit(SignUpCubitSuccess());
    } catch (e) {
      emit(SignUpCubitFailed(
          error: e.toString().replaceFirst('Exception: ', '')));
    }
  }
}
