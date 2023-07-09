import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/network/models/reset_password_model.dart';
import 'package:monasba/network/services/forget_password_service.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  ResetPasswordModel? resetPasswordModel;

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    try {
      resetPasswordModel = await ForgetPasswordService()
          .forgetPassword(email: email);
      emit(ForgetPasswordSuccess());
    } catch (error) {
      emit(
        ForgetPasswordFailure(
          error: error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }
}
