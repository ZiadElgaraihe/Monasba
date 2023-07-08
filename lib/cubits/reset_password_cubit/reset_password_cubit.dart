import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/network/models/reset_password_model.dart';
import 'package:monasba/network/services/forget_password_service.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  ResetPasswordModel? resetPasswordModel;

  Future<void> forgetPassword({required String email}) async {
    emit(ResetPasswordLoading());
    try {
      resetPasswordModel = await ForgetPasswordService()
          .forgetPassword(isSignUp: false, email: email);
      emit(ResetPasswordSuccess());
    } catch (error) {
      emit(
        ResetPasswordFailed(
          error: error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }
}
