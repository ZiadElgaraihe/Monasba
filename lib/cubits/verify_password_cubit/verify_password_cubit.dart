import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/network/services/verify_password_service.dart';

part 'verify_password_state.dart';

class VerifyPasswordCubit extends Cubit<VerifyPasswordState> {
  VerifyPasswordCubit() : super(VerifyPasswordInitial());

  Future<void> verifyPassword({required String resetCode}) async {
    emit(VerifyPasswordLoading());
    try {
      await VerifyPasswordService().verifyPassword(resetCode: resetCode);
      emit(VerifyPasswordSuccess());
    } catch (error) {
      emit(
        VerifyPasswordFailure(
          error: error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }
}
