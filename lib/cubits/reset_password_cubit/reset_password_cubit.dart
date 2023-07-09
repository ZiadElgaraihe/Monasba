import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/network/services/reset_password_service.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  Future<void> resetPassword({
    required String newPassword,
    required String confirmPassword,
    required String token,
  }) async {
    emit(ResetPasswordLoading());
    try {
      await ResetPasswordService().resetPassword(
        newPassword: newPassword,
        confirmPassword: confirmPassword,
        token: token,
      );
      emit(ResetPasswordSuccess());
    } catch (error) {
      emit(
        ResetPasswordFailure(
          error: error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }
}
