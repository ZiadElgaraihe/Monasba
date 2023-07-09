import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/network/models/reset_password_model.dart';
import 'package:monasba/network/services/resend_forget_password_service.dart';

part 'resend_forget_password_state.dart';

class ResendForgetPasswordCubit extends Cubit<ResendForgetPasswordState> {
  ResendForgetPasswordCubit() : super(ResendForgetPasswordInitial());

  ResetPasswordModel? resetPasswordModel;
  Future<void> resendForgetPassword({required String token}) async {
    emit(ResendForgetPasswordLoading());
    try {
      resetPasswordModel = await ResendForgetPasswordService()
          .resendForgetPassword(token: token);
      emit(ResendForgetPasswordSuccess());
    } catch (error) {
      emit(
        ResendForgetPasswordFailure(
          error: error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }
}
