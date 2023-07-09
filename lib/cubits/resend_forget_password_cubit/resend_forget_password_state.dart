part of 'resend_forget_password_cubit.dart';

@immutable
abstract class ResendForgetPasswordState {}

class ResendForgetPasswordInitial extends ResendForgetPasswordState {}

class ResendForgetPasswordLoading extends ResendForgetPasswordState {}
class ResendForgetPasswordSuccess extends ResendForgetPasswordState {}
class ResendForgetPasswordFailure extends ResendForgetPasswordState {
  ResendForgetPasswordFailure({required this.error});

  final String error;
}
